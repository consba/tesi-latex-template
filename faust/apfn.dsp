import("stdfaust.lib");

dfld(t, g) = ( + : de.delay(ma.SR,t-1))~(*(g)) : mem;

apf(t,g) = _ <: *(-g) + (dfld(t,g)*(1-g^2));

dflda(t,g) =  (+ : de.delay(ma.SR,t-1) : apf(t,g))~ *(g) : mem;

//NUOVO ALLPASS con delay in uscita e mix di segnale diretto
apfn(t,g) = _ <: *(-g) + dflda(t,g) * (1-g^2);

process = apfn;