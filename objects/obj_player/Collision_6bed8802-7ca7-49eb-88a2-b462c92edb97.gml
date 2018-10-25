/// @description Collide
with (other)
{
	physics_apply_force(x,y,0,-30);	
}

if phy_speed > 1.5{
	with (obj_camera) shake = global.prb_speed/2;
	play_crashsound();
}

//If stopped on planet, land and refuel.
else if phy_speed < 0.5 && is_refueling = false{
	alarm[0] = room_speed/2;
	is_refueling = true
}

//Destroy probe if we're fast enough and on Normal mode or higher.
if global.difficulty >= 2 && phy_speed > 2.5 && is_refueling == false && end_game == false{
	effect_create_below(ef_explosion, x, y, 4.0, c_orange);
	audio_play_sound(sfx_playerdeath, 10, false);
	image_alpha = 0;
	phy_active = false;
	global.fuel = 0;
	global.pwr = 0;	
	end_game = true;
	alarm[3] = room_speed;
	}