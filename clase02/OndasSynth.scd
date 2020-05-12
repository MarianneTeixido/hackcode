s.boot;
(
SynthDef(\ondas, { | freqIz =0, freqDer = 0, amp = 0.25|
	var osc1, osc2;
	osc1 = SinOsc.ar(freqIz,0,amp);
	osc2 = SinOsc.ar(freqDer,0,amp);
	Out.ar(0,[osc1, osc2])
}).add;
)


~delta = 1; // 0.5 - 2. deep sleep, unsconsciousness
~theta = 5.5; // 4 - 7. Meditative, drowsy, sleeping. Memory, spatial learning
~mu = 9; // 9 - 11. associated with voluntary movement
~alpha = 10; // 7.5 - 12.5. Relaxed states of mind
~beta1 = 14; // 12.5 - 16. Normal waking consciousness
~beta2 = 18; // 16.5 - 20.
~beta3 = 24; // 20.5 - 28
~gamma = 35; // 32 - 100. Visual awareness, transcendental mental states

// extra bonus vibrations:
~schumann1 = 7.83;
~schumann2 = 14.3;
~schumann3 = 20.8;
~schumann4 = 27.3;
~schumann5 = 33.8;

a = Synth(\ondas, [\freqIz, 200, \freqDer, 200 + ~schumann5]);
a.release