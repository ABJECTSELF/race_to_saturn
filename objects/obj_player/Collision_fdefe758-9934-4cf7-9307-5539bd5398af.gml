/// @description Collide
// You can write your code in this editor
with (other)
{
	physics_apply_force(x,y,0,-30);	
}

if phy_speed > 0.5{
	play_crashsound();
}

if room == rm_menu
	return; //No need to go further at main menu screen.

with (obj_camera) shake = global.prb_speed/2;

//Destroy probe if we're fast enough and on Hard mode.
if global.difficulty == 3 && phy_speed > 3.0 && end_game == false{
	effect_create_below(ef_explosion, x, y, 4.0, c_orange);
	audio_play_sound(sfx_playerdeath, 10, false);
	image_alpha = 0;
	phy_active = false;
	global.fuel = 0;
	global.pwr = 0;	
	end_game = true;
	alarm[3] = room_speed;
	}
