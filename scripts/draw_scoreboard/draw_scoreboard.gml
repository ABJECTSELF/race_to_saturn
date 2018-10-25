///draw_scoreboard()
var p_name, p_time, p_mode, p_score, n_count, p_count, section;
var sgrid = ds_grid_create(4,0);	//List that will store and sort score ranks.
var htotal = window_get_width();
var vtotal = window_get_height();
var hcenter = htotal/2;
var vcenter = vtotal/2;
n_count = 0//Counting variable, start at 0.
p_count = 1//Player variable, start at 1.

draw_sprite_ext(spr_window, image_index, hcenter, vcenter, 3, 4, image_angle, image_blend, 1);

//Create the back button.
	draw_set_color(c_navy);
	draw_set_halign(fa_middle);
	draw_button(hcenter * 0.90, vtotal * .85, hcenter * 1.10, vtotal *.90, true);	
		if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
								hcenter * 0.90, vtotal * .80,
								hcenter * 1.10, vtotal *.90){
			draw_button(hcenter * 0.90, vtotal * .85, hcenter * 1.10, vtotal *.90, false);			
			if mouse_check_button_released(mb_left)
				global.menu_type = 0;					
			}
	draw_set_color(c_white);
	draw_text(hcenter, vtotal*.865, "Close");	

if !file_exists("rts_scores.ini")
	return;	//Stop here if there is no score file yet.

ini_open("rts_scores.ini");//Open the score file.

//First we need to sort our scores in order.
//To do this, we create a list and insert each section name
//based on the value of that section's score.

section = "Player" + string(p_count); //Concatenate Player and count into section name.

while ini_section_exists(section){	//Cycle through all sections in the ini.
	ds_grid_resize(sgrid, 4, ds_grid_height(sgrid)+1); //Resize score grid for each new score.

	p_name = ini_read_string(section, "Name", "...");
	p_time = ini_read_string(section, "Time", "...");
	p_mode = ini_read_string(section, "Mode", "...");
	p_score = ini_read_real(section, "Score", 0);

	ds_grid_add(sgrid, 0, n_count, p_name);
	ds_grid_add(sgrid, 1, n_count, p_mode);
	ds_grid_add(sgrid, 2, n_count, p_time);
	ds_grid_add(sgrid, 3, n_count, p_score);

n_count++;
p_count++;
section = "Player" + string(p_count); 
}

ds_grid_sort(sgrid, 3, false); //Now sort the grid by score.

draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_font(fnt_menu);
draw_set_colour(c_white);
draw_text(hcenter, vtotal*0.12, "Top Scores");	


draw_set_halign(fa_left);
draw_text(htotal*0.20, vtotal*0.25, "Name");
draw_text(htotal*0.35, vtotal*0.25, "Mode");
draw_text(htotal*0.55, vtotal*0.25, "Time");
draw_text(htotal*0.70, vtotal*0.25, "Score");

n_count = 0; //reset counter
while n_count < 10 && n_count < ds_grid_height(sgrid){
	p_name = ds_grid_get(sgrid, 0, n_count);
	p_mode = ds_grid_get(sgrid, 1, n_count);
	p_time = ds_grid_get(sgrid, 2, n_count);
	p_score = ds_grid_get(sgrid, 3, n_count);

	draw_text(htotal*0.20, vtotal*0.30 + (n_count*50), p_name);
	draw_text(htotal*0.35, vtotal*0.30 + (n_count*50), p_mode);
	draw_text(htotal*0.55, vtotal*0.30 + (n_count*50), p_time);
	draw_text(htotal*0.70, vtotal*0.30 + (n_count*50), string(p_score));

n_count++;
}
ds_grid_destroy(sgrid);//Clear the grid from memory.
ini_close();
