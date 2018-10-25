/// @description pull_player()
//Simulate gravity within orbit range.
var source = instance_find(p_id, 0);
var range = source.sprite_width;
var angle = point_direction(obj_player.x, obj_player.y, x, y);
var dist = distance_to_object(obj_player);
var grav = 0;
/*	To calculate the orbital pull when the player is in range,
	we subtract the player's distance to the oribital center
	from the total range value. We then divide this amount
	by the range value to produce a percentage of
	gravitation strength at that range.
*/	
if (distance_to_object(obj_player) < range){
	grav = range - dist;
	grav = grav/range;
	grav = source.localgrav * grav;
	with(obj_player){
		physics_apply_force(x, y,
		lengthdir_x(grav, angle), 
		lengthdir_y(grav, angle));	
	}
	//Add this planet to star map and award 1000 points if it is not explored.
	if p_id.explored == false && p_id != obj_sun{
		p_id.explored = true;
		score += 1000;
		audio_play_sound(sfx_success, 10, false);
		}
		
	//Update planet coordinates if this is the current target.
	if global.planet[global.p_target] == p_id && global.p_target < array_length_1d(global.planet) - 1{
		while global.planet[global.p_target].explored == true 
			global.p_target++; //Find the next unexplored planet and set as target.
	}
	//Recharge if source object is sun
	if p_id == obj_sun && obj_player.is_recharging == false{
		with(obj_player){
			alarm[1] = room_speed/2;
			is_recharging = true
		}	
	}
}

//Pulse orbit color
if orb_alpha = 0.4
	alpha_dec = true;

if orb_alpha = 0.1
	alpha_dec = false;

if alpha_dec == true
	orb_alpha -= 0.001;

else
	orb_alpha += 0.001;