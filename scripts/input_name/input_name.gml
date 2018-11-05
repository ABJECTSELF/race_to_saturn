//input_name()
//Opens the dialogue box for the player to input their name, select difficulty, and change appearance.
//This name value is later used in the Scoreboard.
var htotal = window_get_width();
var vtotal = window_get_height();
var hcenter = htotal/2;
var vcenter = vtotal/2
var s_name = "";

//Draw message window
draw_set_alpha(1);
draw_sprite_ext(spr_window, image_index, hcenter, vcenter, 1.3, 1.5, image_angle, image_blend, 0.80);

//Draw the top bar text.
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_font(fnt_message);
draw_set_colour(c_white);
draw_text(hcenter, vcenter*0.70, "Start New Game");	

//---------------------------------------------------------------------------
//Draw text box.
draw_set_color(c_white);
draw_rectangle(hcenter*0.75, vcenter*0.98, hcenter*0.95, vcenter*0.90, false);

//Draw name string, limited to 8 characters.
if string_length(keyboard_string) > 8
   {
   keyboard_string = string_copy(keyboard_string, 1, 8);
   }
s_name = keyboard_string; 

draw_text(hcenter*0.85, vcenter*0.83, "PILOT NAME");
draw_set_color(c_black);
draw_text(hcenter*0.85, vcenter*0.92, s_name);

//---------------------------------------------------------------------------
//Draw Difficulty Selection
var sMode = "Normal";
var color_dif = c_blue;

//Change difficulty text to match current setting.
if (global.difficulty == 1){
	sMode = "Easy";
	color_dif = c_dkgray;
	}
else if (global.difficulty == 3){
	sMode = "Hard";	
	color_dif = c_maroon;
	}

draw_set_color(color_dif);
draw_button(hcenter * 0.75, vcenter *1.08, hcenter * 0.95, vcenter *1.16, true);
if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
					hcenter * 0.75, vcenter *1.08,
					hcenter * 0.95, vcenter *1.16){
	draw_button(hcenter * 0.75, vcenter *1.08, hcenter * 0.95, vcenter *1.16, false);			
	if mouse_check_button_released(mb_left){
		global.difficulty++;
		if global.difficulty > 3
			global.difficulty = 1;
		}	
	}

draw_set_color(c_white);
draw_text(hcenter*0.85, vcenter*1.02, "DIFFICULTY");
draw_text(hcenter*0.85, vcenter*1.10, sMode);

//---------------------------------------------------------------------------
//Draw Sprite preview box.
//Later, we'll add the ability to change the player's appearance.
draw_set_color(c_black);
draw_GUIbox(hcenter*1.15, vcenter*0.97, 75, 75, "", obj_player.sprite_index, c_black, c_black, false);
draw_set_color(c_white);
draw_text(hcenter*1.15, vcenter*0.83, "PROBE");
draw_text(hcenter*1.15, vcenter*1.07, "Cassini MkII");

//Draw arrows to serve as selection buttons to right and left of preview box.
var color_left = c_blue;	//Default color for left button.
var color_right = c_blue;	//Default color for right button.

//Change colors for left button when moused over, clicked.
if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
						hcenter * 1.05, vcenter *0.93,
						hcenter * 1.09, vcenter *1.02){
		color_left = c_aqua;					
		if mouse_check_button_released(mb_left){
			audio_play_sound(sfx_select, 1, false);
			//Insert code to change player's sprite.
		}
	}
//Change colors for right button when moused over, clicked.
if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
						hcenter * 1.20, vcenter *0.93,
						hcenter * 1.26, vcenter *1.02){
		color_right = c_aqua;					
		if mouse_check_button_released(mb_left){
			audio_play_sound(sfx_select, 1, false);
			//Insert code to change player's sprite.
		}
	}	
//Now draw arrow buttons with chosen colors.		
draw_sprite_ext(spr_arw_white, image_index, hcenter*1.07, vcenter*0.97, 0.75, 1.15, 180.0, color_left, 1);//Left arrow									
draw_sprite_ext(spr_arw_white, image_index, hcenter*1.23, vcenter*0.97, 0.75, 1.15, 0.0, color_right, 1);//Right arrow

//---------------------------------------------------------------------------

//Draw Back/Play buttons.
	draw_set_color(c_navy);
	draw_button(hcenter * 0.75, vcenter *1.18, hcenter * 0.85, vcenter *1.28, true);//Back button
	draw_button(hcenter * 1.15, vcenter *1.18, hcenter * 1.25, vcenter *1.28, true);//Play button
		//Back button
		if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
								hcenter * 0.75, vcenter *1.18,
								hcenter * 0.85, vcenter *1.28){
			draw_button(hcenter * 0.75, vcenter *1.18, hcenter * 0.85, vcenter *1.28, false);			
			if mouse_check_button_released(mb_left)
				global.menu_type = 0;
			}
		//Play button
		if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
								hcenter * 1.15, vcenter *1.18,
								hcenter * 1.25, vcenter *1.28){
			draw_button(hcenter * 1.15, vcenter *1.18, hcenter * 1.25, vcenter *1.28, false);			
			if mouse_check_button_released(mb_left){				
				instance_destroy(obj_player);
				global.name = keyboard_string;
				audio_stop_all();
				room_goto_next();
				}
			}
	draw_set_color(c_white);
	draw_text(hcenter*0.80, vcenter*1.21, "Back");
	draw_text(hcenter*1.20, vcenter*1.21, "Play");
