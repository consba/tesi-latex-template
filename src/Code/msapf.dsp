import("stdfaust.lib");
//-------------------------------------------------------- SCHROEDER APF
// delay variabile min(SR)
dfld(t,g) = ( + : de.delay(ma.SR,t-1))~*(g) : mem;
// all-pass delay variabile
apf(t,g) = _ <: *(-g) + (dfld(t,g)*(1-g^2));
// IR
apfIR = os.impulse : apf(1,1/sqrt(2));
process = apf(1,1/sqrt(2));
