import("stdfaust.lib");
//---------------------------------------- FILTRO FIR UN POLO - UNO ZERO
// first order FIR
// LP = 0 < g < 1
// HP = 0 > g > -1
fir(g) = *(1-g) <: (@(1)*(g)+_);
process = fir;
