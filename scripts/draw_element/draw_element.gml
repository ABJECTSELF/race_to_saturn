//draw_element(x, y, element, value)
/// @description Draws the icon for an element and a number value.
/// @param x
/// @param y
/// @param element
/// @param value

/*Value could correspond to how much of element is
in inventory, on a planet, or how much is required
for an upgrade.
Draw this number so that it fits in the icon box.
*/

var eX, eY, eID, eSprite, nValue;
eX = argument0;
eY = argument1;
eID = argument2;
nValue = argument3;

//Determine sprite to use.
if eID = "li"
	eSprite = spr_element_li;
else if eID = "au"
	eSprite = spr_element_au;
else if eID = "h"
	eSprite = spr_element_h;
else if eID = "al"
	eSprite = spr_element_al;
else if eID = "n"
	eSprite = spr_element_n;
else if eID = "o"
	eSprite = spr_element_o;
else if eID = "po"
	eSprite = spr_element_po;
else if eID = "xe"
	eSprite = spr_element_xe;	
else return; //Invalid element ID. Do nothing.

//Draw sprite at x,y coordinates.
draw_sprite(eSprite, image_index, eX, eY);

//Draw value as string so that it shows up in upper-right portion of element sprite.
draw_set_font(fnt_speed);
draw_text(eX, eY-15, string(nValue));

