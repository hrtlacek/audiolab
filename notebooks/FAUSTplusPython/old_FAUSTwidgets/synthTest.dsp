import("stdfaust.lib");

myFreq = hslider("myFreqPar",100,10,1000,0.1);
offset = hslider("offsetPar",0,-1,1,0.1);
amp = hslider("test",0.5,0,10,0.1);
sinosc = os.osc(myFreq);
outp =sinosc+offset;
process = outp*amp:ma.tanh;
