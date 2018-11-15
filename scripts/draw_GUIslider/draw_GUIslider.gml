//draw_GUIslider(x_center, y_center, length, sprite, value);
//Create a GUI slider that can be used to alter game options.
//Intended to be a faster way to create GUI elements.

var x_center, y_center, length, value;

	x_center = argument0;	//X-coordinate of the center of the box.
	y_center = argument1;	//Y-coordinate of the center of the box.
	length = argument2;		//Total pixel length of the bar.		//Image to display the knob.
	value = argument3;		//Integer that the slider represents.	

var lEdge, hiEdge, rEdge, loEdge;	//Variables used for the left, top, right, and bottom edges of rectangle.
	lEdge = x_center - (length/2);
	hiEdge = y_center - 10;
	rEdge = x_center + (length/2);
	loEdge = y_center + 10;

var xpos;	//This value determines what position the mouse is on the slider bar.
	xpos = ((window_mouse_get_x() - lEdge)/length)*100;	//To calculate this position, we subtract the mouse's total x coordinate
														//by the left Edge coordinate, then divide that by the total length of the bar.
														//Multiplying by 100 gives is the percentage of the bar the mouse is currently at.

	draw_healthbar(lEdge, hiEdge, rEdge, loEdge, value, c_black, c_gray, c_blue, 0.0, true, true);
	
	if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), lEdge, hiEdge - 10, rEdge, loEdge + 10){
		if (mouse_check_button(mb_left)){
			draw_sprite_ext(spr_button, 0, window_mouse_get_x(), y_center, 0.375, 0.375, 0, image_blend, image_alpha);
			return xpos;
			}
		else{
			draw_sprite_ext(spr_button, 0, (lEdge + length*(value/100)), y_center, 0.4, 0.4, 180, image_blend, image_alpha);
			return value;
			}
		}
	draw_sprite_ext(spr_button, 0, (lEdge + length*(value/100)), y_center, 0.4, 0.4, 180, image_blend, image_alpha);	
	return value;	