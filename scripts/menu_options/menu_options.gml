//menu_options()
//Opens the options menu.
//Allows player to adjust music, sfx, and star density.
//Future modifications could allow player to adjust network settings, display size, etc.

//Determine the centers of the screen for GUI element positioning.
var htotal = window_get_width();
var vtotal = window_get_height();
var hcenter = htotal/2;
var vcenter = vtotal/2;

//Draw the options window background.
draw_sprite_ext(spr_window, image_index, hcenter, vcenter, 2, 2.5, image_angle, image_blend, 0.80);

//Draw options text:
	//Top bar:
	draw_set_font(fnt_menu);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_text(hcenter, vtotal * 0.27, "OPTIONS");
	
	//Music:
	draw_set_halign(fa_left);
	draw_text(hcenter * 0.60, vcenter*0.80, "Music:");	
	//SFX:
	draw_text(hcenter * 0.60, vcenter, "SFX:");	
	//Stars VXF
	draw_text(hcenter * 0.60, vcenter*1.20, "Stars:");	


//Draw switches and GUI Boxes.
	//Music:
	global.volume_mus = (draw_GUIslider(hcenter*1.1, vcenter*0.82, 400, global.volume_mus*100)*.01);
	audio_sound_gain(global.song, global.volume_mus, 0);
	//SFX:
	global.volume_sfx = (draw_GUIslider(hcenter*1.1, vcenter*1.02, 400, global.volume_sfx*100)*.01);
	//Stars VFX:
	var sd_color1 = c_black, sd_color2 = c_black, sd_color3 = c_black, sd_color4 = c_black;
	if (global.stars == 0)
		sd_color1 = c_blue;
	if (global.stars == 1500)
		sd_color2 = c_blue;
	if (global.stars == 3000)
		sd_color3 = c_blue;
	if (global.stars == 4500)
		sd_color4 = c_blue;
		
		//Here we're using the boolean return value of draw_GUIbox to act as a switch for each setting.
		//This allows us to draw 4 functional buttons in just 8 lines.
	if (draw_GUIbox(hcenter*0.90, vcenter*1.20, 100, 30, "OFF", spr_null, sd_color1, c_gray, true))
		set_star_density(0);
	if (draw_GUIbox(hcenter*1.05, vcenter*1.20, 100, 30, "LO", spr_null, sd_color2, c_gray, true))
		set_star_density(1500);
	if (draw_GUIbox(hcenter*1.2, vcenter*1.20, 100, 30, "HI", spr_null, sd_color3, c_gray, true))
		set_star_density(3000);
	if (draw_GUIbox(hcenter*1.35, vcenter*1.20, 100, 30, "MAX", spr_null, sd_color4, c_gray, true))
		set_star_density(4500);
		
//Create the back button.
//Goes either to main menu or game depending on where Options was accessed from.
	draw_set_color(c_navy);
	draw_set_halign(fa_middle);
	draw_button(hcenter * 0.90, vcenter * 1.35, hcenter * 1.10, vcenter * 1.45, true);	
		if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
								hcenter * 0.90, vcenter * 1.35,
								hcenter * 1.10, vcenter * 1.45){
			draw_button(hcenter * 0.90, vcenter * 1.35, hcenter * 1.10, vcenter * 1.45, false);			
			if mouse_check_button_released(mb_left)
				global.menu_type = 0;					
			}
	draw_set_color(c_white);
	draw_text(hcenter, vcenter*1.38, "Close");	