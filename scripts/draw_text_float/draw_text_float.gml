//draw_text_float(sourceX, sourceY, yOffset, alphaOffset, color, text)
//Draws a string that appears at a certain point.
//Place this in the UI object to cause it to move and fade away.
var sourceX, sourceY, yOffset, alphaOffset, color, text;
sourceX = argument0;	//Starting X position
sourceY = argument1;	//Starting Y position
yOffset = argument2;	//Amount that text moves vertically. Make Negative for text to move upwards.
alphaOffset = argument3;//Amount that text has faded.
color = argument4;		//Color of text.
text = argument5;		//String of text.

var origColor = draw_get_color();	//Previous draw color, revert to this after function.

//Set alpha and color parameters.
draw_set_color(color);
draw_set_alpha(1-alphaOffset);

//Draw the resulting text.
draw_text(sourceX, sourceY + yOffset, text);

//Reset alpha and color values.
draw_set_alpha(1);
draw_set_color(origColor);