import("stdfaust.lib");
//FILTRO ALLPASS
dfld(t, g) = ( + : de.delay(ma.SR,t-1))~(*(g)) : mem;

apf(t,g) = _ <: *(-g) + (dfld(t,g)*(1-g^2));
process = apf;