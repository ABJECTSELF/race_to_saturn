/// @description Collide
with (other)
{
	physics_apply_force(x,y,0,-30);	
}

if phy_speed > 1.5{
	with (obj_camera) shake = global.prb_speed/2;
	play_crashsound();
}

effect_create_below(ef_firework, x, y, 4.0, c_gray);

//Destroy probe if we're on Normal mode or higher.
if global.difficulty >= 2 && end_game == false{
	effect_create_below(ef_explosion, x, y, 4.0, c_orange);
	audio_play_sound(sfx_playerdeath, 10, false);
	audio_sound_gain(sfx_playerdeath, global.volume_sfx, 0);
	image_alpha = 0;
	phy_active = false;
	global.fuel = 0;
	global.pwr = 0;
	end_game = true;
	alarm[3] = room_speed;
	}