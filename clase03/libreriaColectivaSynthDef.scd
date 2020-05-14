
{Saw.ar(40)*EnvGen.kr(Env.asr(1,1,4),Line.kr(1,0,2),doneAction:2)!2}.scope
//Pau Delirium




s.boot

(
SynthDef(\muestra, {|gate|
	var saw, env, line;
	line= Line.kr(0,1,1), doneAction:2);
	env = EnvGen.kr(Env.asr(1,1,4);
	saw = Saw.ar(40)* env;
    Out.ar(0,saw*env+line*0.5)}).add;
)

a = Synth(\muestra, [gate, 1]!2)
a.set("gate", 0)

//Alina
(
SynthDef(\reto, { | dustVar = 0  |
	var saw, pulse, dust, lftri;
	saw = Saw.ar(460,0.3);
	dust = Dust.kr(dustVar);
	pulse = Pulse.ar(462,0.8,0.5);
    lftri = LFTri.ar(80,3,1);
    Out.ar(0,saw+pulse*dust+lftri)}).add;
)

a = Synth(\reto, [\dustVar, 1]!2)

a.set(\dustVar, 10)

//Silvia Ragui
(
SynthDef(\diezminutos, {|freq|
	var pulse, env;
	env = EnvGen.kr(Env.asr(0.01,1,3),doneAction:2);
	pulse = Saw.ar(freq,amp)* env;
Out.ar(1,pulse)}).add;
)

a = Synth(\diezminutos, [\freq, 40]!2) // Lo prenden
a.set(\freq, 0) // Lo apagan



{Pulse.ar(MouseX.kr(5,20))*(SinOsc.ar(10000,0,0.6)+SinOsc.ar(90,0,0.6))}.scope




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


s.boot


(
SynthDef(\help_synth, { |out, freq = 800, sustain = 1, amp = 0.1|
    Out.ar(out,
        SinOsc.ar(freq, 0, 0.2) * Line.kr(amp, 0, sustain, doneAction: Done.freeSelf)
    )
}).add;
)
b = Synth(\help_synth);


