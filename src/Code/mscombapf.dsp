import("stdfaust.lib");
//-------------------------------------------------------- SCHROEDER APF
// liste di inizializzazione dei tempi comb e allpass
primetc = (3343, 3083, 8951, 4733, 7817, 5591, 3739, 1451, 10303);
primeta = (12511, 6257, 3137, 1571, 787, 397, 199, 101, 53,29, 17,
           11, 7, 5, 3, 2);
// liste di inizializzazione dei guadagni comb e allpass
combg = (.37,.5,.4,.7,.9,.7,.3,.7,.27,.7,.17,.9);
// delay variabile min(SR)
dfld(t,g) = ( + : de.delay(ma.SR,t-1))~*(g) : mem;
// all-pass delay variabile
apf(t,g) = _ <: *(-g) + (dfld(t,g)*(1-g^2));
// comba paralleli, all-pass in serie
combapf((Nc,Na,tc,gc,ta,ga),dw) = _ <: *(sqrt(1-dw))+(
    par(i,Nc, dfld(ba.take(i+1, tc),ba.take(i+1,gc))) :>
    seq(i,Na, apf(ba.take(i+1, ta),ga))) *(sqrt(dw));
// IR
combapfIR = os.impulse :
            combapf((9,16,primetc,combg,primeta,1/sqrt(2)),0.5);
process = combapf((4,2,primetc,combg,primeta,1/sqrt(2)),0.5);
