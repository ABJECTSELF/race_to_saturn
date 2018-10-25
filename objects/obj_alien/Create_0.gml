/// @description Add momentum
physics_apply_local_impulse(0,0, -25 + irandom(50), -25 + irandom(50));
image_xscale = image_xscale*0.75;
image_yscale = image_yscale*0.75;

alarm[0] = room_speed;