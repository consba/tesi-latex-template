//FILTRO COMB
import("stdfaust.lib");
dflc(t, g)= +@(t-1)~*(g) : mem;
process =  dflc(1,0);