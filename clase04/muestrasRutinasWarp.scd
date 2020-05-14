s.boot //Prender el server

a = Buffer.read(s, "/home/unyxt/muestras/808/kick__0_.wav"); // Cargar el buffer, lo guardamos en b. Importante: liberarlo más adelante
b = Buffer.read(s, "/home/unyxt/muestras/808/clap__0_.wav"); // Cargar el buffer, lo guardamos en b. Importante: liberarlo más adelante
c = Buffer.read(s, "/home/unyxt/muestras/ua/08monk.wav");

a.bufnum;
b.bufnum;
a.free
b.free
c.free

(
SynthDef(\playKick, { |bufnum, envbuf|
	var buf;
	buf = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum), 1, 0, 0);
	Out.ar([0, 1], buf)
}).add;
)

d = Synth(\playKick, [\bufnum, a]);

(
SynthDef(\playClap, { |bufnum, envbuf|
	var buf;
	buf = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum), 1, 0, 0);
	Out.ar([0, 1], buf)
}).add;
)

d = Synth(\playKick, [\bufnum, b]);


(
SynthDef(\warp, { |bufnum, envbuf|

	var  warp, pointer, pitch;

	pointer = MouseX.kr(0, 1);
    pitch = MouseY.kr(0.5, 2);

    warp = Warp1.ar(1, bufnum, pointer, pitch, 0.1, envbuf, 8, 0.1, 2);



	Out.ar([0, 1], warp)
}).add;

)

d = Synth(\warp, [\bufnum, c, \envbuf, -1])
d.free

(
r = Routine {

	2´.do({

		8.do({
			"kick secuencia continua".postln;
			Synth(\playKick, [\bufnum, a]);
			0.5.wait;
			"clap secuencia continua".postln;
			Synth(\playClap, [\bufnum, b]);
			0.5.wait;
		});

		0.25.wait;

		8.do({
			"kick secuencia errática".postln;
			Synth(\playKick, [\bufnum, a]);
			[0.125, 0.25, 0.5].choose.wait;
			"clap secuencia errática".postln;
			Synth(\playClap, [\bufnum, b]);
			[0.125, 0.25, 0.5].choose.wait;
		});
	})

}.play;
)

r.stop;
r.play;