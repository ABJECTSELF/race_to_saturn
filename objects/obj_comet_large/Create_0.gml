/// @description Set Parameters
//Asteroids are essentially "mini-planets".
//They have weak orbits and fewer elements.

//Generate a name.
obj_name = gen_name(1);

alpha_dec = true;	//Whether the colors are decreasing in alpha value
in_orbit = false;	//Whether player has entered field of orbit.
orbit_angle = 0;	//The last known angle the player was at.
orbit_total = 0;	//The total amount of the orbit the player has completed (0-360)
orbit_zenith = false;//Whether player has reached this orbit's zenith point (180 degrees)
scanbox_override = false; //Player has not yet set scanbox window themselves.


//Randomize Characteristics
p_size = irandom_range(40,500);
p_density = random_range(0.8, 3.0);
p_grav = random_range(0.5, 4.0);
localgrav = p_grav*10;
p_temp = irandom_range(2,10);
p_threatLevel = 0;
p_threatType = "";
p_type = "Asteroid";
p_name = obj_name;

//Next, apply standard movement forces.
alarm[1] = room_speed;
physics_apply_local_impulse(-25, 0,
					random_range(-500, 500),
					random_range(-500, 500));