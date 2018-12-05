///spawn_entity()
//Create an entity at a random location within a radius around the player.
if global.ents >= global.max_ents
	return;	//Stop here if we're already at maximum entity capacity.
	
var ent_id, index, xloc, xangle;

index = irandom(4);					//Which obstacle from array to generate.
ent_id = global.obstacles[index];	//ID of chosen obstacle.
xloc = random_range(5000, 9500);	//Distance to player.
xangle = irandom_range(0, 359);		//Range around player.

//Create this obstacle somewhere around the player.
instance_create_layer(obj_player.x + lengthdir_x(xloc, xangle), obj_player.y + lengthdir_y(xloc, xangle), obj_player.layer, ent_id);

//Increment number of entities in the game.
global.ents += 1;