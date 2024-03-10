import("stdfaust.lib");

//ATMOVERB

G = hslider("g",0,0,.85,.001);
T=hslider("Time",0,0,2000,1);
g = G;

x = hslider("x",.5,.1,.99,.001);
y = hslider("y",.5,.1,.99,.001);
z = hslider("z",.15,.1,.99,.001); 

altezza = hslider("profondità",11,1,300,.001);
larg = hslider("larghezza",32,1,300,.001);
lung = hslider("altezza",20,1,300,.001);

rifLat = hslider("assLat",.707,.1,.99,.001);
rifFro = hslider("assFro",.55,.1,.99,.001);
rifSoff = hslider("assSoff",.71,.1,.99,.001);
rifPav = hslider("assPav",.13,.1,.99,.001);



atm = 2;
press = 76 * (atm);
temp = hslider("temperatura",20,-220,300,.001);
stp = (1.2930, 0.7710, 1.2507, 3.2170, 1.9760, 0.0899, 0.7170, 1.2500,1.4290, 0.804);
p = (ba.take(1,stp)*press)/(press * (1 + (0.00367*temp)));
velSuono = ((1.402*atm*(1.013*10^5))/p) : sqrt ;

t1 = ((z*altezza)/velSuono);
t6 = (((1 - z)*altezza)/velSuono);
t2 = ((x*larg)/velSuono);
t3 = (((1 - x)*larg)/velSuono);
t4 = ((y*lung)/velSuono);
t5 = (((1 - x)*lung)/velSuono);

ts = (t1, t6, t2, t3, t4, t5);
tsa1 = (t1,t2,t4);
tsa2 = (t6,t3,t5);

gs1 = z*rifPav ; 
gs6 = (1 - z)*rifSoff ;
gs2 = x*rifLat;
gs3 = (1 - x)*rifLat;
gs4 = y*rifFro ;
gs5 = (1 - y)*rifFro ;

gs=(gs1,gs6,gs2,gs3,gs4,gs5);
gsa1=(gs1,gs2,gs4);
gsa2=(gs6,gs3,gs5);

lpf = _ <: ((_@1))+_;
comblp(t,g1,g) = (+ : de.delay(ma.SR,t-1)) ~ ((((_<:(lpf : *(g1)),_):>_)) : (*(g*(1-g1))):>_) : mem;

apfmoor(t, g) = _<: ((+ : _*(g)),_<:_,!,_+_ : _, zm(t) : ro.cross(2))~(0 -_) : +
with{
    zm(t) = de.delay(ma.SR,t);
};

process = _,_<:((_<:*(1-g)+(_<: par(i,3,comblp(ba.take(i+1,tsa1),ba.take(i+1,gsa1),g)) :> seq(i,2,apfmoor(T, g)))/4) ,(_<:*(1-g)+(_<: par(i,3,comblp(ba.take(i+1,tsa2),ba.take(i+1,gsa2),g)) :> seq(i,2,apfmoor(T, g)))/4) ) ;