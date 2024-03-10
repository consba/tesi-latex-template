import("stdfaust.lib");
// SCHROEDER DFL (DELAY VARIABILE)
dfld(t,g) = ( + : de.delay(ma.SR,t-1))~*(g) : mem;
process = os.impulse : dfld(1,1/sqrt(2));