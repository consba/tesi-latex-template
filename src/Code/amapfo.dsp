import("stdfaust.lib");
//-------------------------------- MOORER OSCILLATING ALL-PASS (LATTICE)
apf(t,g,x) = (x+_ : *(-g) <: _+x,_ :
             de.delay(ma.SR,t-1),_)~(0-_) : mem+_;
apfo(0,t,g,x) = x;
apfo(1,t,g,x) = apf(t,g,x);
apfo(n,t,g,x) = (x+_ : *(-g) <: _+x,_ : apfo(n-1,t,g),_ :
                de.delay(ma.SR,t-1),_)~(0-_) : mem+_;
apfoIR = os.impulse : apfo(2,1,1/sqrt(2));
process = apfo(2,1,1/sqrt(2));
