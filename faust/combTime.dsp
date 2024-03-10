import("stdfaust.lib");

x = hslider("x",.5,.1,.99,.001);
y = hslider("y",.5,.1,.99,.001);
z = hslider("z",.15,.1,.99,.001);

altezza = hslider("profondità",11,1,300,.001);
larg = hslider("larghezza",32,1,300,.001); 
lung = hslider("altezza",20,1,300,.001);

atm = 1;
press = 76 * (atm);
temp = hslider("temperatura",20,-220,300,.001);
stp = (1.2930, 0.7710, 1.2507, 3.2170, 1.9760, 0.0899, 0.7170, 1.2500,1.4290, 0.804);
p = (ba.take(1,stp)*press)/(press * (1 + (0.00367*temp)));
velSuono = ((1.402*atm*(1.013*10^5))/p) : sqrt ;

//Calcolo i TIME per i comb
t1 = ((z*altezza)/velSuono);
t6 = (((1 - z)*altezza)/velSuono);
t2 = ((x*larg)/velSuono);
t3 = (((1 - x)*larg)/velSuono);
t4 = ((y*lung)/velSuono);
t5 = (((1 - x)*lung)/velSuono);

//Divisione dei valori in 2 liste per L/R
ts = (t1, t6, t2, t3, t4, t5);
tsa1 = (t1,t2,t4);
tsa2 = (t6,t3,t5);

process = ts;