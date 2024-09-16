import("stdfaust.lib");

//Calcolo della velocità del suono in funzione di pressione atmosferica, temperatura e gas

atm = 1; //pressione atmosferica in Atmosfere
press = 76 * (atm);//conversione da atmosfere a pressione cm/hg
temp = hslider("temperatura",20,-220,300,.001);
stp = (1.2930, 0.7710, 1.2507, 3.2170, 1.9760, 0.0899, 0.7170, 1.2500,1.4290, 0.804);
p = (ba.take(1,stp)*press)/(press * (1 + (0.00367*temp)));
//viene convertita la pressione da atmosfere a pascal (* 1.013*10^5 )
velSuono = ((1.402*atm*(1.013*10^5))/p) : sqrt ; //1.402 coefficiente dilatazione adiabatica per i gas biatomici, 1.6 monoatomici 1.3 poliatomici
process = velSuono;