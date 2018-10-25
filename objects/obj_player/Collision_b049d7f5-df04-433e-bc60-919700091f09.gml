/// @description Collide
with (obj_camera) shake = global.prb_speed/2;

effect_create_below(ef_firework, x, y, 5.0, c_orange);

//Destroy probe if we're on Normal mode or higher.
if global.difficulty >= 2 && end_game == false{
	effect_create_below(ef_explosion, x, y, 4.0, c_orange);
	audio_play_sound(sfx_playerdeath, 10, false);
	image_alpha = 0;
	phy_active = false;
	global.fuel = 0;
	global.pwr = 0;	
	end_game = true;
	alarm[3] = room_speed;
	}