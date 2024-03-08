import("stdfaust.lib");

dfld(t, g) = ( + : de.delay(ma.SR,t-1))~(*(g)) : mem;

apf(t,g) = _ <: *(-g) + (dfld(t,g)*(1-g^2));

dflda(t,g) =  (+ : de.delay(ma.SR,t-1) : apf(t,g))~ *(g) : mem;

apfn(t,g) = _ <: *(-g) + dflda(t,g) * (1-g^2);
//liste di inizializzazione dei tempi comb e allpass
primetc1 = (10007, 3343, 1117, 373, 127, 43, 17, 7, 3, 2);
primetc2 = (25013, 12511, 6257, 3137, 1571, 787, 397, 199, 101, 53,29, 17, 11, 7, 5, 3, 2);
//liste di inizializzazione dei guadagni comb e allpass
combg1 = (.37,.5,.4,.7,.9,.7);
combg2 = (.3,.7,.27,.7,.17,.9);

//ALGORITMO COMB-ALLPASS. È presente una cascata di 6 filtri comb seguiti da 2 allpass in serie
combapf((t,g,t1,g1),g2) = _<:_+(
    par(i,6, dflda(ba.take(i+1, t),ba.take(i+1,g))) :> 
    seq(i, 2, apfn(ba.take(4-i, t1),ba.take(i+1,g1))))*(g2);

process = combapf((primetc1,combg1,primetc2,combg2),.707);
