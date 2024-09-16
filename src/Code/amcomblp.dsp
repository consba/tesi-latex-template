import("stdfaust.lib");
//----------------------------------------------- MOORER COMB CON FILTRO
// first order FIR
// LP = 0 < g < 1
// HP = 0 > g > -1
fir(g) = *(1-g) <: (@(1)*(g)+_);
// process = no.pink_noise : fir(0.999);
// MOORER COMB CON FILTRO
dfldf(t,g,g1) = (+ : de.delay(ma.SR,t-1))~(fir(g1)*(g2(g,g1))) : mem
with{
    g2(g,g1) = g*(1-g1);
};
dfldfIR = os.impulse <: dfldf(10,1/sqrt(2),0.24), dfld(10,1/sqrt(2));
process = dfldf(1,1/sqrt(2),0.76);

// SCHROEDER DFL (DELAY VARIABILE)
dfld(t,g) = ( + : de.delay(ma.SR,t-1))~(*(g)) : mem;
