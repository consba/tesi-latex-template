import("stdfaust.lib");
//-------------------------------------------------------- SCHROEDER DFL
// implementazione senza correzione
dfl(t,g) = +@(t)~*(g);
// correzione IR
dflc(t,g) = +@(t-1)~*(g) : mem;
// delay variabile min(SR)
dfld(t,g) = ( + : de.delay(ma.SR,t-1))~*(g) : mem;
// IR
dflIR = os.impulse : dflc(1,1/sqrt(2));
process = dflc(1,1/sqrt(2));
