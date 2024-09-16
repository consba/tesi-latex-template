import("stdfaust.lib");
//----------------------------------------------------------- MOORER APF
apf(t,g,x) = (x+_ : *(-g) <: _+x,_ :
             de.delay(ma.SR,t-1),_)~(0-_) : mem+_;
// IR
apfIR = os.impulse : apf(1,1/sqrt(2));
process = apf(1,1/sqrt(2));
