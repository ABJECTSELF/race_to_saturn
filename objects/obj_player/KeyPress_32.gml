/// @description Fire Impulse
//Check that we have Impulses available.
if global.pulse <= 0
	return;

//Apply force of impulse.
physics_apply_local_impulse(-100, 0, 100,0);

//Decrement impulse count.
global.pulse -= 1;

//Create visual effect.
effect_create_below(ef_flare,
					x + lengthdir_x(-20, image_angle * -1),
					y + lengthdir_y(-20, image_angle),
					2.0, c_aqua);
effect_create_below(ef_ring,
					x + lengthdir_x(-20, image_angle * -1),
					y + lengthdir_y(-20, image_angle),
					1.0, c_aqua);
					
with (obj_camera) shake = 20;

//Play Sound;
audio_play_sound(sfx_impulse, 1, false);
audio_sound_gain(sfx_impulse, global.volume_sfx, 0);