import("stdfaust.lib");

lpf = _ <: ((_@1))+_;
//COMB DI MOORER con filtro lowpass
comblp(t,g1,g) = (+ : de.delay(ma.SR,t-1)) ~ ((((_<:(lpf : *(g1)),_):>_)) : (*(g*(1-g1))):>_) : mem;

process = comblp;