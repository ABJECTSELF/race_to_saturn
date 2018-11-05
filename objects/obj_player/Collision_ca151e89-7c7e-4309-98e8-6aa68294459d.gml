/// @description Collide
effect_create_below(ef_firework, x, y, 4.0, c_gray);
image_alpha = 0;
phy_active = false;

if end_game == false{	
	audio_play_sound(sfx_playerdeath, 10, false);
	audio_sound_gain(sfx_playerdeath, global.volume_sfx, 0);
	end_game = true;
	alarm[2] = room_speed; //Player has won the game!
}