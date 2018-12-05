/// @description Create planets
//Activate planet creation.
planetList = array_args(obj_mercury, obj_venus, obj_earth, obj_mars, obj_jupiter, 
								obj_saturn, obj_uranus, obj_neptune, obj_pluto);
create_planets();

//Create entities every half-second.
alarm[1] = room_speed/2;

//Set up the "spark" emitter.
impSpark = part_system_create();
part_system_depth(impSpark, obj_player.depth);

