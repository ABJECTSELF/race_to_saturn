//draw_GUIbox(x_center, y_center, width, height, text, sprite, color1, color2, isButton);
//Create a GUI box that can store a sprite, text, and button functionality.
//Intended to be a faster way to create GUI elements.
//Use TRUE or FALSE values to determine whether button is active.
var x_center, y_center, width, height, text, sprite, color1, color2, isButton;

	x_center = argument0;	//X-coordinate of the center of the box.
	y_center = argument1;	//Y-coordinate of the center of the box.
	width = argument2;		//Total pixel width of the box.
	height = argument3;		//Total pixel height of the box.
	text = argument4;		//Text to display in the box. If "", no text is used.
	sprite = argument5;		//Image to display in the box. If blank, no image is used.
	color1 = argument6;		//Color used for box background.
	color2 = argument7;		//Color used when mouse hovers over box.
	isButton = argument8;	//Whether or not the button reacts to being clicked.
							//NOTE: If isButton is false, draw_GUIbox will always have a return value of FALSE;
	
var lEdge, hiEdge, rEdge, loEdge;	//Variables used for the left, top, right, and bottom edges of rectangle.
	lEdge = x_center - (width/2);
	hiEdge = y_center - (height/2);
	rEdge = x_center + (width/2);
	loEdge = y_center + (width/2);


	var prevColor = draw_get_color(); //Store the current draw color so we can revert to it later.
	draw_set_color(color1);			//Then set the draw color of this box to Argument 6.
	
	//If mouse is over box, change color. Note that no noticeable effect happens if color1 and color2 are same.
	if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), lEdge, hiEdge, rEdge, loEdge){
		draw_set_color(color2);
			//If this box is a button, execute a script on press.
			if (isButton) && mouse_check_button_released(mb_left){
				//NOTE: We're now drawing buttons instead of just rectangles, simply because they look slightly better.
				draw_button(lEdge, hiEdge, rEdge, loEdge, false);
				return true;
			}
	}

	//Draw the box itself.
	draw_button(lEdge, hiEdge, rEdge, loEdge, false);

	//Revert color.
	draw_set_color(prevColor);
	
	//Draw text in center of box using default color.
	//Note that font should be set before calling this function.
	draw_set_halign(fa_center);
	draw_text(x_center, y_center, text);

	//Draw sprite.
	draw_sprite_ext(sprite, 0, x_center, y_center, 1, 1, 0, image_blend, image_alpha);	
	
	//Lastly, return TRUE if mouse is clicked in box area.
	if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(), lEdge, hiEdge, rEdge, loEdge) && (isButton) && (mouse_check_button_released(mb_left)))
			return true;

	return false;