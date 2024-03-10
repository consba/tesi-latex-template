import("stdfaust.lib");
// MOORER ALL-PASS
apf(t,g,x) = (x+_ : *(-g) <: _+x,_ : de.delay(ma.SR,t-1),_)~(0-_) : mem+_;
process = os.impulse : apf(1,1/sqrt(2));