import("stdfaust.lib");
// FIRST ORDER FIR
fir(g) = *(1-g) <: (@(1)*(g)+_);
// process = no.pink_noise : fir(0.999);
// MOORER COMB CON FILTRO
dfldf(t,g,g1) = (+ : de.delay(ma.SR,t-1))~(fir(g1)*(g2(g,g1))) : mem
with{
    g2(g,g1) = g*(1-g1);
};
process = os.impulse <: dfldf(10,1/sqrt(2),0.24), dfld(10,1/sqrt(2));

// SCHROEDER DFL (DELAY VARIABILE)
dfld(t,g) = ( + : de.delay(ma.SR,t-1))~(*(g)) : mem;