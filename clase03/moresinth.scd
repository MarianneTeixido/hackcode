s.boot






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


//Sinte, amp, freq, mouse



(
SynthDef(\mouse, {| min, max, amp|    //Argumentos
	var sin, mousex, mousey;          //Variables locales
	mousey = MouseY.kr(0,0.5);
	mousex = MouseX.kr(min,max);     //Función de control de la frecuencia generadora de audio
	sin = Pan2.ar(SinOsc.ar(mousex,0,mousey*amp));     //Generador
	Out.ar(0,sin)}).add;
)

b = Synth(\mouse, [\amp, 0, \min,70, \max, 1000]); // Lo prenden
b.set(\amp, 0) // Lo apagan

b.release



////

(
SynthDef(\mouse, {| min, max, amp|    //Argumentos
	var sin, mousex, mousey;          //Variables locales
	mousey = MouseY.kr(0,0.5);
	mousex = MouseX.kr(min,max);     //Función de control de la frecuencia generadora de audio
	sin = Pan2.ar(SinOsc.ar(mousex,0,mousey*amp));     //Generador
	Out.ar(0,sin)}).add;
)

b = Synth(\mouse, [\amp, 0, \min,70, \max, 1000]); // Lo prenden
b.set(\amp, 0) // Lo apagan

b.release




(
{
({RHPF.ar(OnePole.ar(BrownNoise.ar, 0.99), LPF.ar(BrownNoise.ar, 14)
* 400 + 500, 0.03, 0.003)}!2)
+ ({RHPF.ar(OnePole.ar(BrownNoise.ar, 0.99), LPF.ar(BrownNoise.ar, 20)
* 800 + 1000, 0.03, 0.005)}!2)
* 4
}.play
)