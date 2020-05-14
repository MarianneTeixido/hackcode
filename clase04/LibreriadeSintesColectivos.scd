




(SynthDef(\liber, {| fq1 = 10000, fq2 = 90, mn=5,mx = 20, gate =0|
	var pulse, sin1,sin2, env;
	pulse = Pulse.ar(MouseX.kr(mn,mx));
	sin1 = SinOsc.ar(fq1,0,0.6);
	sin2 = SinOsc.ar(fq2,0,0.6);
	env = EnvGen.kr(Env.adsr(0.03,0.3,0.5,1.0),gate);
	Out.ar(0,Pan2.ar(pulse*(sin1+sin2)*env));

}).add)


a = Synth(\liber , [\gate, 1]);
a.set(\fq1, 10000, \fq2,200);
a.set(\mn,2,\mx, 30);
a.set(\gate,0);

a.free













//gate es Line
(
SynthDef(\paurum, {|fq=40, inicio = 1, fin= 0, dur =2|
	var saw, env, gate;
	gate= Line.kr(inicio,fin,dur);
	env = EnvGen.kr(Env.asr(1,1,4),gate,doneAction:2);
	saw = Saw.ar(fq)* env;
    Out.ar(0,saw*env!2)
}).add;

)

b = Synth(\paurum, [\fq, 60,\inicio,1, \fin, 0, \dur,8]);
b.free


















//loopeado y control directo con gate
(
SynthDef(\paurum2, {|fq=40, gate = 0|
	var saw, env;
	env = EnvGen.kr(Env.asr(1,1,4),gate,doneAction:2);
	saw = Saw.ar(fq)* env;
    Out.ar(0,saw*env!2)
}).add;

)

c = Synth(\paurum2, [\fq, 60,\gate, 1]);
c.set(\gate,0);
c.set(\fq,10);
c.free
































(
SynthDef(\alina, { | dustVar = 20 , fs= 40, fp = 100,w = 0.5, fl=200,amp=0.5 |
	var saw, pulse, dust, lftri;
	saw = Saw.ar(fs,0.3);
	dust = Dust.kr(dustVar);
	pulse = Pulse.ar(fp,w,0.5);
    lftri = LFTri.ar(fl,3,1);
	Out.ar(0,Pan2.ar(saw*(pulse*dust+lftri))*amp)}).add;
)

d = Synth(\alina, [\dustVar, 1, \fs, 460, \fp,100,\w, 0.5,\fl,200, \amp, 0.5]!2)

d.set(\dustVar, 30);
d.set(\fl,40)
d.set(\fl, 20);
d.set(\amp, 0);

d.free
s.meter
































(
SynthDef(\silvia, {|freq= 40, gate = 0, amp = 0|
	var pulse, env;
	env = EnvGen.kr(Env.asr(0.01,1,3),gate,doneAction:2);
	pulse = Saw.ar(freq,amp)* env;
Out.ar(1,pulse!2)}).add;
)

a = Synth(\silvia, [\freq, 40, \gate, 1, \amp, 1]);
a.set(\gate, 0);
a.free
















