import("stdfaust.lib");

//Definisco i valori del coefficiente di riflessione delle pareti
rifLat = hslider("assLat",.707,.1,.99,.001); //Coefficiente di riflessione pareti laterali
rifFro = hslider("assFro",.55,.1,.99,.001);//Coefficiente di riflessione pareti frontali
rifSoff = hslider("assSoff",.71,.1,.99,.001);//Coefficiente di riflessione soffitto
rifPav = hslider("assPav",.13,.1,.99,.001);//Coefficiente di riflessione pavimento

process = rifLat,rifFro,rifSoff,rifPav;