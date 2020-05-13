

s.boot

/*
Pasos para usar el vocoder en Linux y Mac
1.- Entrar a la videollamda
2.- Prender jack
3.- Bootear SuperCollider
4.- Declar el vocoder
5.- Conectar Supercollider con Jack Source
6.- Enjoy!
*/



s.boot

s.meter

(
SynthDef(\vocoder, {|pch =1, amp = 0|
	var pitch;
	pitch = PitchShift.ar(SoundIn.ar(0), pitchRatio: pch );
Out.ar(0,pitch*amp)  }).add;
)

a = Synth(\vocoder, [\pch, 0.5, \amp, 1.2]) // Lo prenden
a.set(\pch, 1.5);
a.set(\amp, 2.0)
a.release // Lo apagan
a.free


//Ejemplo de Env.asr
(
SynthDef("prueba", {|gate|
	var pulse, env;
	env = EnvGen.kr(Env.asr(0.01,1,3),gate,doneAction:2);
	pulse = Pulse.ar(15)* env;
Out.ar(0,pulse*env*0.5)}).add;
)

a = Synth("prueba", ["gate", 1]!2) // Lo prenden
a.set("gate", 0) // Lo apagan
