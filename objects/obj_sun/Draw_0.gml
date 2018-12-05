/// @description draw Scanbox
//If Player is within 2X the object's width, draw the scanbox.

draw_set_alpha(orb_alpha);
//Draw the orbit according to option set.
//0 = off, 1 = line, 2 = full
if (global.orbit_circ == 1)
	draw_circle_color(x, y, sprite_width, color1, color2, true);

else if (global.orbit_circ == 2)
	draw_circle_color(x, y, sprite_width, color1,  color2, false);
	
draw_set_alpha(1);	

draw_self();
var range = sprite_width*2
if (distance_to_object(obj_player) < range && global.mapmode == false)
	draw_scanbox(self, percentScanned);