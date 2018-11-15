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

//Populate top bar with room name, timer and score
var timer = string(game_time_minute) + ":" + string(game_time_second);
if game_time_second < 10
	timer = string(game_time_minute) + ":0" + string(game_time_second);
	
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_colour(c_gray);
draw_set_font(fnt_speed);
draw_text(htotal*0.25, vtotal*.02, "LOCATION");
draw_text(hcenter, vtotal*.02, "TIME");
draw_text(htotal*0.75, vtotal*.02, "SCORE");	
	
draw_set_font(fnt_message);
draw_text(htotal*0.25, vtotal*.05, "Sol");
draw_text(hcenter, vtotal*.05, timer);	
draw_text(htotal*0.75, vtotal*.05, string(score));

//If mouse hovers over bottom bar, show synth help.
if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
	0, vtotal*0.88, htotal, vtotal)){
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(htotal*0.04, vtotal*0.80, htotal*0.16, vtotal*0.90, false);//left (power)
draw_rectangle(htotal*0.10, vtotal*0.70, htotal*0.22, vtotal*0.80, false);//top (fuel)
draw_rectangle(htotal*0.16, vtotal*0.80, htotal*0.28, vtotal*0.90, false);//right (impulse)
//draw_rectangle(htotal*0.04, vtotal*0.70, htotal*0.28, vtotal*0.90, false);
draw_set_font(fnt_menu);
draw_text_color(htotal*0.06, vtotal*0.82, "[Z]", c_lime, c_lime, c_green, c_green, 1);
draw_text_color(htotal*0.12, vtotal*0.72, "[X]", c_teal, c_teal, c_aqua, c_aqua, 1);
draw_text_color(htotal*0.18, vtotal*0.82, "[C]", c_fuchsia, c_fuchsia, c_fuchsia, c_fuchsia, 1);
draw_set_font(fnt_speed);
draw_set_color(c_white);
draw_set_alpha(1);
draw_text(htotal*0.12, vtotal*0.81, "Synthesize\nPower");
draw_text(htotal*0.18, vtotal*0.71, "Synthesize\nFuel");
draw_text(htotal*0.24, vtotal*0.81, "Synthesize\nImpulse");
draw_text(htotal*0.06, vtotal*0.86, "Req:");
draw_element(htotal*0.10, vtotal*0.88, "h", 1);
draw_element(htotal*0.12, vtotal*0.88, "he", 2);
draw_element(htotal*0.14, vtotal*0.88, "mg", 2);
draw_text(htotal*0.12, vtotal*0.76, "Req:");
draw_element(htotal*0.16, vtotal*0.78, "h", 1);
draw_element(htotal*0.18, vtotal*0.78, "n", 2);
draw_element(htotal*0.20, vtotal*0.78, "o", 2);
draw_text(htotal*0.18, vtotal*0.86, "Req:");
draw_element(htotal*0.22, vtotal*0.88, "ar", 2);
draw_element(htotal*0.24, vtotal*0.88, "po", 1);
draw_element(htotal*0.26, vtotal*0.88, "xe", 2);
	}
	
//Draw Element Icons in lower left screen
draw_element(htotal*0.08, vtotal*0.95, "ar", global.elem_ar);
draw_element(htotal*0.10, vtotal*0.95, "h", global.elem_h);
draw_element(htotal*0.12, vtotal*0.95, "he", global.elem_he);
draw_element(htotal*0.14, vtotal*0.95, "mg", global.elem_mg);
draw_element(htotal*0.16, vtotal*0.95, "n", global.elem_n);
draw_element(htotal*0.18, vtotal*0.95, "o", global.elem_o);
draw_element(htotal*0.20, vtotal*0.95, "po", global.elem_po);
draw_element(htotal*0.22, vtotal*0.95, "xe", global.elem_xe);	
	
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
		vtotal*.93, "ALERT: APPROACHING TERMINATION SHOCK");		
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