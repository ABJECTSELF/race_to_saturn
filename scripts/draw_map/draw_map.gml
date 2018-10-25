///draw_map()
//This function creates the solar map
var sun = obj_sun;
var planet = array_args(obj_mercury, obj_venus, obj_earth, obj_mars, obj_jupiter, obj_saturn);
//Draw the star map.
for (var i = 0; i < array_length_1d(planet); i++)
	{
	if planet[i].explored = true{ //Only create lines if the planet has been mapped.
		draw_set_alpha(0.5);
		draw_set_colour(c_yellow);
		draw_line_width(sun.x, sun.y, planet[i].x, planet[i].y, 100); //Draw the line from sun to planet.
		draw_set_alpha(1);
		draw_circle(planet[i].x, planet[i].y, planet[i].sprite_width*1.5, false); //Draw yellow highlight around planet.
		draw_set_colour(c_black);
		draw_circle(planet[i].x, planet[i].y, planet[i].sprite_width*1.25, false); //Draw black inner circle to create a ring effect.
		}
	}