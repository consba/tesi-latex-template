//Determino le dimensioni della stanza

altezza = hslider("profondità",11,1,300,.001); //profondità stanza
larg = hslider("larghezza",32,1,300,.001); //larghezza stanza
lung = hslider("altezza",20,1,300,.001); //altezza soffitto

//process = altezza, larg, lung;

lar1 = larg*.5;
lar2 = larg*1.5;
lung1 = lung*.5;
lung2 = lung*1.5;
h = altezza;

sb1 = lar1*lung1;
sb2 = lar2*lung2;

apotl=((lar2/2) - (lar1/2))^2 + h^2 : sqrt;
suplarg = ((lung2 + lung1)*apotl)/2;

apotsopra = ((lung2/2) - (lung1/2))^2 + h^2 : sqrt;
suplung = ((lar2 + lar1)*apotsopra)/2;

supTot = sb1 + sb2 + suplarg*2 + suplung*2;
v = (sb1 + sb2 + ((sb1*sb2) : sqrt))*h;

process = rt60;
assorb = .7;
rt60 = (24*(10:log)*v)/(344*supTot*assorb);