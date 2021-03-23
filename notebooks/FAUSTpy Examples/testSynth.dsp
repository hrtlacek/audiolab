import("stdfaust.lib");
f = hslider("freq",100,10,1200,0.1);
o = os.osc(f);
process = o;