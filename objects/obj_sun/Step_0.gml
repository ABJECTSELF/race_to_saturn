/// @description Scan planet, pull objects, orbit sun.

//Minimize scanbox if option is set.
if (global.scanbox_opn = 0 && scanbox_override == false)
	window_min = true;

if (isScanning && !scanned){
	if (percentScanned >= 0.95){
		//var pntDist = distance_to_object(obj_sun)/10;
		scanned = true;
		//Add this planet to star map and award points.
		explored = true;
		score += (p_size/p_grav); /*Score is planet size divided by gravity plus distance from sun
								So a large planet with low gravity gives the best value.
								although this ratio is specifically to put a relative cap
								on the point value of large objects such as stars.*/
		audio_play_sound(sfx_success, 10, false);
		
		//Find the next unexplored planet and set as target.
		var target = obj_world.planetList[global.p_target];
		var planetLength = array_length_1d(obj_world.planetList)-1;
		var nCount = 0;
		if (target == obj_name){
			while (target.scanned == true && nCount < 10){
				if (global.p_target == planetLength)
					global.p_target = 0;
				else
					global.p_target++;
				
				target = obj_world.planetList[global.p_target];
				nCount++;
			}
		}
	}
}

//Simulate gravity within orbit range.
var range = sprite_width/2;
var angle = point_direction(obj_player.x, obj_player.y, x, y);
var dist = distance_to_object(obj_player);
var grav = 0;
/*	To calculate the orbital pull when the player is in range,
	we subtract the player's distance to the oribital center
	from the total range value. We then divide this amount
	by the range value to produce a percentage of
	gravitation strength at that range.
*/	
if (dist < range){//Player is in orbit range.
	grav = ((range-dist)/range)*localgrav; //Calculate pull based on distance.

	with(obj_player)
		physics_apply_force(x, y,
		lengthdir_x(grav, angle), 
		lengthdir_y(grav, angle));	
			
/*	To scan an object, the player must complete a full 360 orbit
	of the object. To do this, we record the angle the player enters
	orbit, then each step update the player's current angle to the
	object and compare the difference with the previously recorded
	angle, adding that angle to a sum. Once the sum hits our target
	threshold, the object is scanned.
*/

	if (in_orbit == false && scanned == false){ //Player is entering orbit for the first time.
		in_orbit = true
		orbit_angle = point_direction(x, y, obj_player.x, obj_player.y);	
	}
	else{	//Player is continuing orbit.
		isScanning = true; //Player scans object while orbiting.
		orbit_total = abs(angle_difference(orbit_angle, point_direction(x, y, obj_player.x, obj_player.y)));
		if (orbit_total >= 179)		//NOTE: I'm definitely cheating here.
			orbit_zenith = true;	//If there's a mathematical way to determine when a 360 circle is completed
		if (orbit_zenith == true)	//without the use of extra variables, replace this here.
			orbit_total = 360 - orbit_total;
		percentScanned = orbit_total/360;//Pass scanning progress to planet.
	//orbit_angle = point_direction(x, y, obj_player.x, obj_player.y);
	}
	//Recharge if source object is sun
	if  obj_name == obj_sun && obj_player.is_recharging == false{
		with(obj_player){
			alarm[1] = room_speed/2;
			is_recharging = true
		}	
	}
}
else{ //Player is not in orbit range. Reset variables.
	in_orbit = false;
	orbit_zenith = false;
	isScanning = false;
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
	
