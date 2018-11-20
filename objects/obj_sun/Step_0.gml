/// @description Scan planet

//Minimize scanbox if option is set.
if (global.scanbox_opn = 0 && scanbox_override == false)
	window_min = true;

if (isScanning && !scanned){
	if (percentScanned >= 0.95){
		scanned = true;
		//Add this planet to star map and award points.
		explored = true;
		score += p_size/p_grav; /*Score is planet size divided by gravity.
								So a large planet with low gravity gives the best value.
								although this ratio is specifically to put a relative cap
								on the point value of large objects such as stars.*/
		audio_play_sound(sfx_success, 10, false);
		
		//Find the next unexplored planet and set as target.
		while global.planet[global.p_target].explored == true 
				global.p_target++; 
			
	}
}