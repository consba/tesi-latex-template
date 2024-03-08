import("stdfaust.lib");
// lista di inizializzazione dei tempi per gli allpass. I tempi sono numeri primi e mantengono un rapporto di 3/1 tra di loro
primet10 = (10007, 3343, 1117, 373, 127, 43, 17, 7, 3, 2);
// SCHROEDER DFL (DELAY VARIABILE)
dfld(t,g) = ( + : de.delay(ma.SR,t-1))~(*(g)) : mem;
// SCHROEDER ALL-PASS
apf(t,g) = _ <: *(-g) + (dfld(t,g)*(1-g^2));
// SERIE DI 5 ALLPASS
apfseq =  seq(i, 10, apf(ba.take(i+1, primet10),1/sqrt(2)));
process = os.impulse : apfseq;
//process = os.osc(440)*(0.1) : apfseq;