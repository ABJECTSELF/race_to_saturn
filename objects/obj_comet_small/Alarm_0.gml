/// @description Check distance
//If this entity is too far from the player, it will destroy itself.
if (distance_to_object(obj_player) > global.max_dist)
	instance_destroy();
	
else
	alarm[0] = room_speed;