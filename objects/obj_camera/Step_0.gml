/// @description Shake
//slowly decay any applied shake
shake *= 0.9;

//screenshake
var cam = view_camera[0]
camera_set_view_pos(cam, camera_get_view_x(cam)+random_range(-shake,shake), 
					camera_get_view_y(cam)+random_range(-shake,shake));
/*					
//Zoom out as player speed increases.
//Zoom should only happen above 40km/s and to a max of 150%.
var spd = obj_player.phy_speed;
if (spd < 3)
	return;

var spd_width = 1600*1.50;
var spd_height = 900*1.50;
camera_set_view_size(cam, spd_width, spd_height);
*/