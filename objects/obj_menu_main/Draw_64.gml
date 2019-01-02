/// @description Main Menu
//display_set_gui_size(1600, 900);
var htotal = window_get_width();
var vtotal = window_get_height();
var hcenter = htotal/2;
var vcenter = vtotal/2;
var button;

//----------------------------------------
//Draw Main Menu
	draw_set_halign(fa_left);
	draw_set_colour(c_white);
	draw_set_font(fnt_menu);
	draw_set_alpha(0.5);
	
if global.menu_type == 0{
	draw_text(
		htotal * 0.55,
		vtotal * 0.25, "v" + string(GM_version));	
	draw_text(
		htotal * 0.25,
		vtotal * 0.30, "by Jonathan Cwiok");	
	draw_set_alpha(1);
//Start Game button
if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
							htotal * 0.10, vtotal * 0.40,
							htotal * 0.30, vtotal * 0.45){
		draw_set_color(c_yellow)
		if mouse_check_button_released(mb_left)
			{
			keyboard_string = "Player";	
			global.menu_type = 4;
			audio_play_sound(sfx_select, 1, false);
			}
		}								
	draw_text(
		htotal * 0.10,
		vtotal * 0.40, "Start Game");
		
//Set Difficulty button
	draw_set_color(c_white);
	if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
							htotal * 0.10, vtotal * 0.50,
							htotal * 0.30, vtotal * 0.55){
		draw_set_color(c_yellow)
		if mouse_check_button_released(mb_left){
			audio_play_sound(sfx_select, 1, false);
			global.menu_type = 1;}
		}		
	draw_text(
		htotal * 0.10,
		vtotal * 0.50, "Options");	

//Set Scoreboard button
	draw_set_color(c_white);
	if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
							htotal * 0.10, vtotal * 0.60,
							htotal * 0.30, vtotal * 0.65){
		draw_set_color(c_yellow)
		if mouse_check_button_released(mb_left){
			audio_play_sound(sfx_select, 1, false);
			global.menu_type = 2;}
		}	
	draw_text(
		htotal * 0.10,
		vtotal * 0.60, "View Scoreboard");	
		
//Set Instructions button		
	draw_set_color(c_white);
	if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
							htotal * 0.10, vtotal * 0.70,
							htotal * 0.30, vtotal * 0.75){
		draw_set_color(c_yellow)
		if mouse_check_button_released(mb_left){
			audio_play_sound(sfx_select, 1, false);
			global.menu_type = 3;}
		}	
	draw_text(
		htotal * 0.10,
		vtotal * 0.70, "Instructions");	
		
//Set Exit button.
	draw_set_color(c_white);
	if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
							htotal * 0.10, vtotal * 0.80,
							htotal * 0.30, vtotal * 0.85){
		draw_set_color(c_yellow)
		if mouse_check_button_released(mb_left)
			game_end();
		}
	draw_text(
		htotal * 0.10,
		vtotal * 0.80, "Quit");	
return;
}

			
//----------------------------------------
//Draw Options Menu.
if global.menu_type == 1{
menu_options();
return;
}

//----------------------------------------
//Draw Scoreboard
if global.menu_type == 2{
	draw_scoreboard();
	return;
}

//----------------------------------------
//Draw Instructions
if global.menu_type == 3{
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_text(
		htotal * 0.10,
		vtotal * 0.25, "INSTRUCTIONS");

//Draw Back button.
	if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
							htotal * 0.10, vtotal * 0.80,
							htotal * 0.20, vtotal * 0.85){
		draw_set_color(c_yellow)
		if mouse_check_button_released(mb_left){
			audio_play_sound(sfx_select, 1, false);
			global.menu_type = 0;}
		}
	draw_text(
		htotal * 0.10,
		vtotal * 0.80, "Back");	

//Draw instruction body.
	draw_set_font(fnt_message);
	draw_set_color(c_white);
	draw_text(
		htotal * 0.10,
		vtotal * 0.35, "Your mission is to land on Saturn by any means before you run out of power/fuel.\n"
					 + "-Press W to fire main thrusters and A and D to fire side thrusters\n"
					 + "-Press Space to fire an Impulse\n"
					 + "-Press Shift to view the Star Map\n"
					 + "-Press Left Mouse Button to fire the mining laser\n"
					 + "-Complete a full orbit of a planet to scan it\n"
					 + "-Orbit each target planet to learn Saturn's location\n"
					 + "-Land on a terran planet to restore fuel and collect elements\n"
					 + "	or use the mining laser to collect from hazardous surfaces.\n"
					 + "-Use elements to synthesize power, fuel and impulses on the go.\n"
					 + "-Orbit the Sun to restore power\n"
					 + "-Avoid colliding with obstacles\n"
					 + "-Careful not to land on Jupiter or the Sun!");

return;		
}

//----------------------------------------
//Draw name input
if global.menu_type == 4{
	input_name();
	return;
}