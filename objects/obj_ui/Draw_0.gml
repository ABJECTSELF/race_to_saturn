/// @description Draw HUD
// You can write your code in this editor
if !object_exists(obj_player)
	return;		//Stop here if there is no player object.


//Draw map at a lower depth if shift is pressed.
if (keyboard_check(vk_shift)){
	depth = 1000
	draw_map();
	}
else
	//Reset depth if map is inactive.
	depth = init_depth;

//Show player's current speed in KM/S.
//Draw text outine
draw_set_halign(fa_right);
draw_set_colour(c_black);
draw_set_font(fnt_spd_outline);
draw_text(
	obj_player.x + 110,
	obj_player.y + -15, string(global.prb_speed));
draw_set_font(fnt_speed_sml);	
draw_text(
	obj_player.x + 135,
	obj_player.y + -15, "km/s");
	
//Draw speed text
draw_set_alpha(0.75);
draw_set_colour(c_white);
draw_set_font(fnt_speed);
draw_text(
	obj_player.x + 110,
	obj_player.y + -15, string(global.prb_speed));

draw_set_font(fnt_speed_sml);	
draw_text(
	obj_player.x + 135,
	obj_player.y + -15, "km/s");

draw_set_halign(fa_left);

//Draw Player's name.
draw_set_font(fnt_speed);
draw_text(
	obj_player.x + 50,
	obj_player.y - 30, global.name);

//Draw impulse counter
draw_set_font(fnt_speed);
draw_text(
	obj_player.x + 125,
	obj_player.y + 5, global.pulse);
draw_set_font(fnt_speed_sml);
draw_text(
	obj_player.x + 105,
	obj_player.y + 5, "IMP:");
	
//Draw HUD legend.
draw_text(
	obj_player.x + 45,
	obj_player.y - 9, "S");
draw_text(
	obj_player.x + 45,
	obj_player.y + 4, "P");
draw_text(
	obj_player.x + 45,
	obj_player.y + 14, "F");
	
//Draw power/fuel bars.
var pw;
var fl;
pw = (global.pwr / global.prb_maxpwr) * 100;
draw_healthbar(obj_player.x + 51,
				obj_player.y + 5,
				obj_player.x + 100,
				obj_player.y + 10, pw, c_black, c_red, c_lime, 0, false, false);
				
fl = (global.fuel / global.prb_maxfuel) * 100;
draw_healthbar(obj_player.x + 51,
				obj_player.y + 13,
				obj_player.x + 100,
				obj_player.y + 18, fl, c_black, c_red, c_aqua, 0, false, false);	

//Reset alpha
draw_set_alpha(1);	

	
//Draw guide arrow
var planet = array_args(obj_mercury, obj_venus, obj_earth, obj_mars, obj_jupiter, obj_saturn);
var arw_target = planet[global.p_target];
if object_exists(arw_target){
with (obj_player){
	arw_angle = point_direction(x, y, arw_target.x, arw_target.y);
	draw_sprite_ext(spr_arw_ylw, 0, 
					x + lengthdir_x(40, arw_angle), 
					y + lengthdir_y(40, arw_angle),
					0.25, 1, arw_angle,
					image_blend, global.guide_alpha);
}
				
//Draw map arrow
if global.mapmode == true{
	draw_sprite_ext(spr_arw_ylw, 0, obj_player.x, obj_player.y,
					image_xscale*10, image_yscale*10,
					obj_player.image_angle, c_aqua, 1);

//Draw Trajectory Line (if conditions are met.
var line_alpha = 0;
if	(global.difficulty = 1)
	line_alpha = 1.0;	//If difficulty is easy, line alpha is always full.
else if (global.difficulty = 2)
	line_alpha = 1.0 - (obj_player.phy_speed/5.0);//Set line alpha to the reverse percentage player's speed is to 5.
	
with (obj_player){
	draw_set_alpha(line_alpha);
	var current_dir = point_direction(0, 0, phy_speed_x, phy_speed_y)
	draw_line_width_color(x, y, x + lengthdir_x(7500, current_dir), y + lengthdir_y(7500, current_dir),
							25, c_green, c_black);
	}					

//Reset draw alpha.
draw_set_alpha(1.0);
}
}
