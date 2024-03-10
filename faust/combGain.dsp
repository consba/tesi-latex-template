import("stdfaust.lib");

x = hslider("x",.5,.1,.99,.001); //posizione asse x
y = hslider("y",.5,.1,.99,.001); //posizione asse y
z = hslider("z",.15,.1,.99,.001); //posizione asse z

rifLat = hslider("assLat",.707,.1,.99,.001);
rifFro = hslider("assFro",.55,.1,.99,.001);
rifSoff = hslider("assSoff",.71,.1,.99,.001);
rifPav = hslider("assPav",.13,.1,.99,.001);

//Calcolo GAIN per i comb
gs1 = z*rifPav ; 
gs6 = (1 - z)*rifSoff ;
gs2 = x*rifLat;
gs3 = (1 - x)*rifLat;
gs4 = y*rifFro ;
gs5 = (1 - y)*rifFro ;

//Divisione dei valori in 2 liste per L/R
gs=(gs1,gs6,gs2,gs3,gs4,gs5);
gsa1=(gs1,gs2,gs4);
gsa2=(gs6,gs3,gs5);

process = gs;