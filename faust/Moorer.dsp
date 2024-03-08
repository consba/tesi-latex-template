import("stdfaust.lib");

comb(t, g) = ( + : de.delay(ma.SR,t-1))~(*(g)) : mem;//comb Moorer
//process = os.impulse :  comb(1, .7);
apfm(t, g) = _<: ((+ : _*(g)),_<:_,!,_+_ : _, zm(t) : ro.cross(2))~(0 -_) : + :lowpass(g)
with{
    zm(t) = de.delay(ma.SR,t);
};//allpass moorer
//process = os.impulse : apfm(60,.9);
lowpass(g1) = _ <: ((_@1))+_:_*g1;
//process = os.pulsetrain(100,1) <: lowpass(.1),_;

combf(t,g1,g) = ( + : de.delay(ma.SR,t-1))~(_<:lowpass(g1): (*(g*(1-g1))):>_) : mem;//comb Moorer con filtro low pass all'interno
combf1(t,g1,g) = (+ : de.delay(ma.SR,t-1)) ~ ((((_<:(lowpass(g1)),_):>_)) : (*(g*(1-g1))):>_) : mem;//comb Moorer con filtro low pass all'interno migliorato

//process = os.impulse:combf1(200,.7,.826)<:_,_;

G = hslider("g",0,0,.85,.001);

//x = G;

x = hslider("x",.1,.1,.99,.001); //posizione asse x
y = hslider("y",.1,.1,.99,.001); //posizione asse y
z = hslider("z",.1,.1,.99,.001); //posizione asse z

altezza = hslider("profondità",1,1,300,.001); //profondità stanza
larg = hslider("larghezza",1,1,300,.001); //larghezza stanza
lung = hslider("altezza",1,1,300,.001); //altezza soffitto

atm = 1;
press = 76 * (atm);
temp = hslider("temperatura",20,-220,300,.001);
stp = (1.2930, 0.7710, 1.2507, 3.2170, 1.9760, 0.0899, 0.7170, 1.2500,1.4290, 0.804);
p = (ba.take(1,stp)*press)/(press * (1 + (0.00367*temp)));
velSuono = ((1.402*atm*(1.013*10^5))/p) : sqrt ;
//process = velSuono;

assLat = hslider("assLat",.1,.1,.99,.001); //Coefficiente di assorbimento pareti laterali
assFro = hslider("assFro",.1,.1,.99,.001);//Coefficiente di assorbimento pareti frontali
assSoff = hslider("assSoff",.1,.1,.99,.001);//Coefficiente di assorbimento soffitto
assPav = hslider("assPav",.1,.1,.99,.001);//Coefficiente di assorbimento pavimento

g = G; //Overall reverberation - GT60

//Gain Comb

gs1 = z*assPav ; 
gs6 = (1 - z)*assSoff ;
gs2 = x*assLat;
gs3 = (1 - x)*assLat;
gs4 = y*assFro ;
gs5 = (1 - y)*assFro ;

//Tempi Comb

t1 = ((z*altezza)/velSuono)*1000;
t6 = (((1 - z)*altezza)/velSuono)*1000;
t2 = ((x*larg)/velSuono)*1000;
t3 = (((1 - x)*larg)/velSuono)*1000;
t4 = ((y*lung)/velSuono)*1000;
t5 = (((1 - x)*lung)/velSuono)*1000;

gs=(gs1,gs6,gs2,gs3,gs4,gs5);
gsa1=(gs1,gs2,gs4);
gsa2=(gs6,gs3,gs5);
ts = (t1, t6, t2, t3, t4, t5);
tsa1 = (t1,t2,t4);
tsa2 = (t6,t3,t5);
//process =  _ <: *(1-g) + (_<: par(i,6,combf1(ba.take(i+1,ts),ba.take(i+1,gs),g)) :> seq(i,2,apfm(400, .3)))/2<:_,_;

//process = _ <:(*(1-x) + (_<: par(i,3,combf1(ba.take(i+1,ts),ba.take(i+1,gs),x)) :> seq(i,1,apfm(400, .3)))/4), (*(1-x) + (_<: par(i,3,combf1(ba.take(i+1,ts),ba.take(i+1,gs),g)) :> seq(i,1,apfm(400, g)))/4);

//process = _ <: *(1-x) + (_<: par(i,6,combf1(ba.take(i+1,ts),ba.take(i+1,gs),g)) :> seq(i,2,apfm(400, g)))/2<:_,_;

T=hslider("Time",0,0,2000,1);

process = _,_<:((_<:*(1-g)+(_<: par(i,3,combf1(ba.take(i+1,tsa1),ba.take(i+1,gsa1),g)) :> seq(i,1,apfm(T, g)))/4) ,(_<:*(1-g)+(_<: par(i,3,combf1(ba.take(i+1,tsa2),ba.take(i+1,gsa2),g)) :> seq(i,1,apfm(T, g)))/4) ) ;