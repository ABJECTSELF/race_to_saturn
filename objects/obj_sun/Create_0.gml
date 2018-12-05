/// @description Set orbit
alpha_dec = true;	//Whether the colors are decreasing in alpha value
in_orbit = false;	//Whether player has entered field of orbit.
orbit_angle = 0;	//The last known angle the player was at.
orbit_total = 0;	//The total amount of the orbit the player has completed (0-360)
orbit_zenith = false;//Whether player has reached this orbit's zenith point (180 degrees)
scanbox_override = false; //Player has not yet set scanbox window themselves.

/*//This section obsolete with 0.5.2
var obj;
p_id = "";

orb = instance_create_layer(x, y, layer, obj_orbit);
obj = obj_name
with (orb){
	p_id = obj;
}
*/

 
//Double the size of the sprite if indicated.
//Mostly used to create massive suns without using massive sprites.
if double_size == true
	{
		image_xscale = image_xscale*2;
		image_yscale = image_yscale*2;
	}