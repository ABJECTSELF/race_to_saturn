/// @description Draw GUI
if !object_exists(obj_player)
	return;		//Stop here if there is no player object.

//Establish values for edges and center of screen.
var htotal = window_get_width();
var vtotal = window_get_height();
var hcenter = htotal/2;
var vcenter = vtotal/2;

draw_msgwindow(); //Draw the message window when conditions are met.

//Draw top and bottom GUI bars.
draw_set_colour(c_black);
draw_set_alpha(0.5);
display_set_gui_size(1600, 900);
draw_rectangle(0, 0, htotal, vtotal * 0.10, false);
draw_rectangle(0, vtotal, htotal, vtotal * 0.9, false);

//Populate top bar with timer.
var timer = string(game_time_minute) + ":" + string(game_time_second);
if game_time_second < 10
	timer = string(game_time_minute) + ":0" + string(game_time_second);
	
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_colour(c_gray);
draw_set_font(fnt_speed);
draw_text(
	hcenter,
	vtotal*.02, "TIME");
draw_set_font(fnt_message);
draw_text(
	hcenter,
	vtotal*.05, timer);	
	
//Create status bar
draw_set_font(fnt_speed);
draw_text(
	hcenter,
	vtotal*.90, "STATUS");	

//Message: refueling
draw_set_font(fnt_message);
if obj_player.is_refueling == true{
	draw_set_colour(c_green);
	draw_text(
		hcenter,
		vtotal*.93, "PROBE LANDED: REFUELING");	
return;
}

//Message: recharging
if obj_player.is_recharging == true{
	draw_set_colour(c_green);
	draw_text(
		hcenter,
		vtotal*.93, "SOLAR ENERGY DETECTED: RECHARGING");	
return;
}

//Message: Approaching edge of map
if (obj_player.x < room_width*0.1 || obj_player.x > room_width*0.9
	||	obj_player.y < room_height*0.1 || obj_player.y > room_height*0.9){
	draw_set_colour(c_red);
	draw_text(
		hcenter,
		vtotal*.93, "ALERT: APPROACHING SIGNAL LIMIT");		
return;
}

//Message: Low Fuel
if global.fuel < 25{
	draw_set_colour(c_red);
	draw_text(
		hcenter,
		vtotal*.93, "ALERT: FUEL LEVEL CRITICAL");		
return;
}

//Message: Low Power
if global.pwr < 25{
	draw_set_colour(c_red);
	draw_text(
		hcenter,
		vtotal*.93, "ALERT: LOW POWER");		
return;
}

//Currently targeted planet.
var planet = array_args(obj_mercury, obj_venus, obj_earth, obj_mars, obj_jupiter, obj_saturn);
var target = planet[global.p_target];
var p_distance = (point_distance(obj_player.x, obj_player.y, target.x, target.y) - (target.sprite_height/2)) *.0006684
	draw_set_colour(c_gray);
	draw_text(
		hcenter,
		vtotal*.93, "Target: " + target.p_name + " " + string(p_distance) + "au");	