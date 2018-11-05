/// @description Burst Star Emitter
if !object_exists(obj_player) //Stop if there's no Player object.
	return;

var eDist = ps_distr_linear;

part_emitter_region(starfield, star_emitter,
					obj_player.x - 3000, obj_player.x + 3000,
					obj_player.y - 3000, obj_player.y + 3000, 
					ps_shape_ellipse, eDist);
					
part_emitter_burst(starfield, star,star_emitter, global.stars);
alarm[0] = room_speed;