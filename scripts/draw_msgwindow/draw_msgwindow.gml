///draw_msgwindow()
//This script creates the message window and text for options, game over screens and victory screens.
var htotal = window_get_width();
var vtotal = window_get_height();
var hcenter = htotal/2;
var vcenter = vtotal/2;
var text_bar = "";
var text_body = "";
var menu = false; //Deactivate message window until activated by a menu type.
var buttons = 0; //0 = Buttons disabled. 1 = Quit/Restart buttons 2 = Continue to Scoreboard button.
				//3 = Open Options window.

//Set parameters for Escape menu.
if global.menu_escape == true{
	menu = true;
	text_bar = "Race to Saturn";
	text_body = "";
	buttons = 1;
}

//Set parameters for Game Over menu.
if global.menu_gameover == true{
	menu = true;
	text_bar = "Game Over";
	text_body = "Probe Lost\nScore: " + string(score);
	buttons = 2;
}

//Set parameters for Goal menu.
if global.menu_won == true{
	menu = true;
	text_bar = "Mission Successful";
	text_body = "Congratulations!\nScore: " + string(score);
	buttons = 2;
}

if menu == false //Stop here if no menu is flagged.
	return;

//Draw message window
draw_sprite(spr_window, image_index, hcenter, vcenter)

//Draw the top bar text.
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_font(fnt_message);
draw_set_colour(c_white);
draw_text(hcenter, vcenter*0.80, text_bar);	

//Draw the body text.
draw_text(hcenter, vcenter*0.92, text_body);

//Stop here if buttons are disabled.
if buttons = 0
	return;

if global.menu_type == 1{//Open Options window and stop here
	menu_options();
	return;
}

//Draw buttons.
if buttons = 1{ //Quit game and Option.
	draw_set_color(c_navy);
	draw_button(hcenter*0.92, vcenter*0.90, hcenter * 1.08, vcenter*0.98, true);
	draw_button(hcenter * 0.82, vcenter *1.05, hcenter * 0.92, vcenter *1.15, true);
	draw_button(hcenter * 1.08, vcenter *1.05, hcenter * 1.18, vcenter *1.15, true);
		//Options button
		if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
								hcenter*0.92, vcenter*0.90,
								hcenter * 1.08, vcenter*0.98){
			draw_button(hcenter*0.92, vcenter*0.90, hcenter * 1.08, vcenter*0.98, false);			
			if mouse_check_button_released(mb_left){
				global.menu_type = 1;				
				}
			}		
		//Yes button
		if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
								hcenter * 0.82, vcenter *1.05,
								hcenter * 0.92, vcenter *1.15){
			draw_button(hcenter * 0.82, vcenter *1.05, hcenter * 0.92, vcenter *1.15, false);			
			if mouse_check_button_released(mb_left){
				room_goto_previous();
				global.menu_escape = false;
				}
			}
		//No button
		if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
								hcenter * 1.08, vcenter *1.05,
								hcenter * 1.18, vcenter *1.15){
			draw_button(hcenter * 1.08, vcenter *1.05, hcenter * 1.18, vcenter *1.15, false);			
			if mouse_check_button_released(mb_left)				
				global.menu_escape = false;				
			}
	draw_set_color(c_white);
	draw_text(hcenter, vcenter*0.92, "Options");
	draw_text(hcenter*0.87, vcenter*1.08, "Quit");
	draw_text(hcenter*1.13, vcenter*1.08, "Back");
}

if buttons = 2{ //Go to main menu.
	draw_set_color(c_navy);
	draw_button(hcenter * 0.90, vcenter*1.05, hcenter * 1.10, vcenter *1.15, true);	
		//Accept button
		if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
								hcenter * 0.90, vcenter*1.05,
								hcenter * 1.10, vcenter *1.15){
			draw_button(hcenter * 0.90, vcenter*1.05, hcenter * 1.10, vcenter *1.15, false);			
			if mouse_check_button_released(mb_left){
				write_scoreboard();
				draw_scoreboard();
				room_goto_previous();
				global.menu_escape = false;
				global.menu_type = 2;
				}
			}
	draw_set_color(c_white);
	draw_text(hcenter, vcenter*1.08, "Accept");	
}