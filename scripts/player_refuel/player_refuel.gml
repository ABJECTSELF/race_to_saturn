///player_refuel()
var fmax = global.prb_maxfuel; //Max fuel amount
var pmax = global.max_pulse;	//Max pulse amount

if global.fuel < fmax{ //Check that we need fuel

	if global.fuel + 5 > fmax
		global.fuel = fmax;
	else
		global.fuel += 5;
}

if (global.pulse < pmax){ //Check that we need pulse.
	global.pulse += 1;
	audio_play_sound(sfx_recharge, 1, false);
	audio_sound_gain(sfx_recharge, global.volume_sfx, 0);
	}