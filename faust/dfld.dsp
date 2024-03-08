//FILTRO COMB utilizzando la funzione de.delay
import("stdfaust.lib");
dfld(t, g) = ( + : de.delay(ma.SR,t-1))~(*(g)) : mem;
process = dfld;