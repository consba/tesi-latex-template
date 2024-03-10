import("stdfaust.lib");
// FIRST ORDER FIR
fir(g) = *(1-g) <: (@(1)*(g)+_);
process = no.pink_noise <: fir(0.86),_;