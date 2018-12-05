///player_move()
//Checks for keys being pressed and adds momentum accordingly.
//If there's no fuel, don't move.
var f_use = global.frate;	//Rate at which fuel is used.
if global.fuel <= 0|| (	
	!(keyboard_check(vk_up) || keyboard_check(ord("W"))) &&
	!(keyboard_check(vk_left) || keyboard_check(ord("A"))) &&
	!(keyboard_check(vk_right) || keyboard_check(ord("D"))))
{
	sprite_index = spr_probe_still;	//If we're out of fuel or not moving,
	audio_stop_sound(sfx_thrust);	//stop thruster sound and
	thrust_sfx = false;
	return;							//use the inactive sprite.
}		

	
if (keyboard_check(vk_up) || keyboard_check(ord("W"))){	    //Forward Movement
sprite_index = spr_probe_fwd;
physics_apply_local_force(-100, 0, global.prb_propel, 0);
effect_create_below(ef_smoke, x + lengthdir_x(-20, image_angle * -1), 
								y + lengthdir_y(-20, image_angle), 
								0.75, c_gray);

global.fuel -= f_use;
fuel_used += f_use;

}


if (keyboard_check(vk_left) || keyboard_check(ord("A"))){		//Left movement.
	physics_apply_torque(-global.prb_torque);
	sprite_index = spr_probe_right;
	
	global.fuel -= f_use;
	fuel_used += f_use;
	}
	
else if (keyboard_check(vk_right) || keyboard_check(ord("D"))){	//Right movement.
	physics_apply_torque(global.prb_torque);
	sprite_index = spr_probe_left;
	
	global.fuel -= f_use;
	fuel_used += f_use;
	}

//Lastly, play thrust sound.
if (thrust_sfx == false){
	audio_play_sound(sfx_thrust, 1, true);
	thrust_sfx = true;
}
//Set thrust volume to global sfx volume
audio_sound_gain(sfx_thrust, global.volume_sfx, 0);