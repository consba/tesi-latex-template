import("stdfaust.lib");
//--------------------------------------- SCHROEDER APF BALANCE TIME GAP
// delay variabile min(SR)
dfld(t,g) = ( + : de.delay(ma.SR,t-1))~*(g) : mem;
// all-pass delay variabile
apf(t,g) = _ <: *(-g) + (dfld(t,g)*(1-g^2));
// delay variabile min(SR)
dflda(t1,t2,g1,g2) = ( + : de.delay(ma.SR,t1-1) :
                       apf(t2,g2))~*(g1) : mem;
// all-pass delay variabile
apfdwp(t1,t2,g1,g2) = _ <: *(-g1) + (dflda(t1,t2,g1,g2)*(1-g1^2));
// IR
apfdwpIR = os.impulse : apfdwp(15,3,1/sqrt(2),1/sqrt(2));
// FR
apfdwpFR = os.osc(1000) : apfdwp(15,3,1/sqrt(2),1/sqrt(2));
// confronto tra all-pass e all-pass annidato
apf_vs_apfdwpIR = os.impulse <: apf(2,1/sqrt(2)), apfdwp(1,1/sqrt(2));
process = apfdwp(1,1,1/sqrt(2),1/sqrt(2));
