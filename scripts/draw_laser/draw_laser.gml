/// @description Draws mining laser
/// @param source The player firing the laser
/// @param range The length of the laser.

var source, range, dir, length, rdmX, rdmY;
source = argument0;
range = argument1;
length = 0;

//Set the depth of the layer to just underneath the player.
depth = source.depth+1;
//Find the direction the mouse is located in relation to the player.
dir = point_direction(source.x, source.y, mouse_x, mouse_y);

//Length of laser is the mouse's distance up to the maximum range provided.
length = clamp(length, point_distance(source.x, source.y, mouse_x, mouse_y), range);

//"Stutter" the laser coordinates to give it a shaky appearance.
rdmX = irandom_range(-6, 6);
rdmY = irandom_range(-6, 6);
/*
//Create sparks
part_emitter_region(impSpark, spark_emitter,
					source.x + lengthdir_x(length, dir) +rdmX, 
					source.y + lengthdir_y(length, dir) +rdmY,
					source.x + lengthdir_x(length, dir) +rdmX, 
					source.y + lengthdir_y(length, dir) +rdmY, 
					ps_shape_ellipse, ps_distr_gaussian);
					
part_emitter_burst(impSpark, spark, spark_emitter, irandom_range(25, 100));
*/
draw_line_width_color(source.x, source.y, 
					source.x + lengthdir_x(length, dir) +rdmX, 
					source.y + lengthdir_y(length, dir) +rdmY, 
					4, c_red, c_black);