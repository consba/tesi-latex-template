import("stdfaust.lib");
// SCHROEDER DFL (DELAY VARIABILE)
dfld(t,g) = ( + : de.delay(ma.SR,t-1))~*(g) : mem;
// SCHROEDER ALL-PASS
apf(t,g) = _ <: *(-g) + (dfld(t,g)*(1-g^2));
process = os.impulse : apf(1,1/sqrt(2));