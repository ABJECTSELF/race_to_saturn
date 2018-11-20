/// @description Color orbital range
var source = instance_find(p_id, 0);

draw_set_alpha(orb_alpha);
//Draw the orbit according to option set.
//0 = off, 1 = line, 2 = full
if (global.orbit_circ == 1)
	draw_circle_color(source.x, source.y, source.sprite_width, source.color1, source.color2, true);

else if (global.orbit_circ == 2)
	draw_circle_color(source.x, source.y, source.sprite_width, source.color1, source.color2, false);
	
draw_set_alpha(1);	