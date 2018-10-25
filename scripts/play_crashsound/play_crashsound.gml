//play_crashsound()
//Play one of 4 crash sound effects.
var nRdm = irandom(4);
var sSfx = sfx_playercrash1;

if (nRdm == 1)
	sSfx = sfx_playercrash2;
else if (nRdm == 2)
	sSfx = sfx_playercrash3;
else if (nRdm == 3)
	sSfx = sfx_playercrash4;
	
//Play the selected sound.
audio_play_sound(sSfx, 10, false);
audio_sound_pitch(sSfx, random_range(0.6, 1.4));