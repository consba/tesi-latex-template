import("stdfaust.lib");

dfld(t, g) = ( + : de.delay(ma.SR,t-1))~(*(g)) : mem;

apf(t,g) = _ <: *(-g) + (dfld(t,g)*(1-g^2));

//NUOVO ALLPASS con delay in uscita
dflda(t,g) =  (+ : de.delay(ma.SR,t-1) : apf(t,g))~ *(g) : mem;

process = dflda;