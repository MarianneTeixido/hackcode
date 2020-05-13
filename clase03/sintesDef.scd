

s.boot/*
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
SynthDef("vocoder", {|p = 0|
	var pitch;
	pitch = PitchShift.ar(SoundIn.ar(0), pitchRatio:1.5);
Out.ar(0,pitch)  }).add;
)

a = Synth("vocoder", ["p", 1.1]!2) // Lo prenden
a.free // Lo apagan



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
