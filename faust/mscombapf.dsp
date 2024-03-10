import("stdfaust.lib");
//liste di inizializzazione dei tempi comb e allpass
primetc1 = (10007, 3343, 1117, 373, 127, 43, 17, 7, 3, 2);
primetc2 = (25013, 12511, 6257, 3137, 1571, 787, 397, 199, 101, 53,29, 17, 11, 7, 5, 3, 2);

//liste di inizializzazione dei guadagni comb e allpass
combg1 = (.37,.5,.4,.7,.9,.7);
combg2 = (.3,.7,.27,.7,.17,.9);

// SCHROEDER DFL (DELAY VARIABILE)
dfld(t,g) = ( + : de.delay(ma.SR,t-1))~*(g) : mem;

// SCHROEDER ALL-PASS
apf(t,g) = _ <: *(-g) + (dfld(t,g)*(1-g^2));

//ALGORITMO COMB-ALLPASS. È presente una cascata di 6 filtri comb seguiti da 2 allpass in serie
combapf((t,g,t1,g1),g2) = _<:*(sqrt(1-g2))+(
    par(i,6, dfld(ba.take(i+1, t),ba.take(i+1,g))) :> 
    seq(i, 2, apf(ba.take(4-i, t1),ba.take(i+1,g1))))*(sqrt(g2));

process = os.impulse : combapf((primetc1,combg1,primetc2,combg2),0.5);
