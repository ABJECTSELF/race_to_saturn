///crash()
//This script creates the crash effect for alien UFOs.
effect_create_above(ef_explosion, x, y, 5, c_orange);
instance_destroy(); //Destroy the original UFO instance with an explosion.

//Now create the replacement "debris" objects near the original crash.
instance_create_layer(x-20, y, layer, obj_ufo_crash_l);
instance_create_layer(x+20, y, layer, obj_ufo_crash_r);
instance_create_layer(x, y-25, layer, obj_ufo_crashg);
instance_create_layer(x+random_range(-20, 20), y+random_range(-20,20), layer, obj_alien);
instance_create_layer(x+random_range(-20, 20), y+random_range(-20,20), layer, obj_alien);

//Play sounds.
audio_play_sound_at(sfx_explosion, x, y, 0, 1000, 3000, 1, false, 1);
audio_play_sound_at(sfx_alien_scream, x, y, 0, 500, 1500, 1, false, 1);

//Set volumes
audio_sound_gain(sfx_explosion, global.volume_sfx, 0);
audio_sound_gain(sfx_alien_scream, global.volume_sfx, 0);