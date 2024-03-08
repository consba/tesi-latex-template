import("stdfaust.lib");
// SCHROEDER DFL
dfl(t,g) = +@(t-1)~*(g) : mem;
process = os.impulse : dfl(1,1/sqrt(2));