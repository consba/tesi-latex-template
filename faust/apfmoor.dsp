import("stdfaust.lib");
//ALLPASS DI MOORER
apfmoor(t, g) = _<: ((+ : _*(g)),_<:_,!,_+_ : _, zm(t) : ro.cross(2))~(0 -_) : +
with{
    zm(t) = de.delay(ma.SR,t);
};
process = apfmoor;