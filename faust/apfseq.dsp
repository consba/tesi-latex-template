import("stdfaust.lib");

dfld(t, g) = ( + : de.delay(ma.SR,t-1))~(*(g)) : mem;

apf(t,g) = _ <: *(-g) + (dfld(t,g)*(1-g^2));

dflda(t,g) =  (+ : de.delay(ma.SR,t-1) : apf(t,g))~ *(g) : mem;

apfn(t,g) = _ <: *(-g) + dflda(t,g) * (1-g^2);
//lista di inizializzazione dei tempi per gli allpass. I tempi sono numeri primi e mantengono un rapporto di 3/1 tra di loro
primet10 = (10007, 3343, 1117, 373, 127, 43, 17, 7, 3, 2);
//SERIE DI 5 ALLPASS
apfseq =  seq(i, 5, apfn(ba.take(i+1, primet10),.707));

process = apfseq;