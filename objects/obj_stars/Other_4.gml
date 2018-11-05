/// @description Form starfield
//Set up particle system.

starfield = part_system_create();
part_system_depth(starfield, 40)

//Create star
star = part_type_create();
part_type_shape(star, pt_shape_pixel);
part_type_orientation(star, 0, 0, 0, 0, 1);
part_type_size(star, .1, 6, 0, 0);
part_type_speed(star, 0,0,0,0);
part_type_direction(star, 0,0,0,0);
part_type_life(star, 250, 2000);
part_type_color_rgb(star, 240, 255,
							240,255,
							240,255);
part_type_alpha3(star, 0, 1.0, 0);

//Create starfield
star_emitter = part_emitter_create(starfield);

part_emitter_region(starfield, star_emitter,
					obj_player.x - 2500, obj_player.x + 2500,
					obj_player.y - 2500, obj_player.y + 2500, 
					ps_shape_ellipse, ps_distr_gaussian);
					
part_emitter_burst(starfield, star,star_emitter, global.stars);
/*
part_emitter_region(starfield, star_emitter,
					obj_player.x - 2500, obj_player.x + 2500,
					obj_player.y - 2500, obj_player.y + 2500, 
					ps_shape_rectangle, ps_distr_linear);
//part_emitter_burst(starfield, star,star_emitter, 10000)
//part_emitter_stream(starfield, star_emitter, star, 1);
*/
alarm[0] = room_speed;