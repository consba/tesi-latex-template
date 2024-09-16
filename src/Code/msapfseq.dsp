import("stdfaust.lib");
//---------------------------------------------------- SCHROEDER APF SEQ
// lista di inizializzazione dei tempi di ritardo in campioni
// i tempi sono numeri primi in un rapporto 3/1
pt10 = (10007, 3343, 1117, 373, 127, 43, 17, 7, 3, 2);
// delay variabile min(SR)
dfld(t,g) = ( + : de.delay(ma.SR,t-1))~*(g) : mem;
// all-pass delay variabile
apf(t,g) = _ <: *(-g) + (dfld(t,g)*(1-g^2));
// serie di all-pass
apfs(N) =  seq(i, N, apf(ba.take(i+1, pt10),1/sqrt(2)));
// IR
apfsIR = os.impulse : apfs(5);
// FR
apffr = os.osc(440)*(0.1) : apfs(5);
process = apfs(2);
