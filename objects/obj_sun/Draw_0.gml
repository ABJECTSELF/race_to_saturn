/// @description draw Scanbox
//If Player is within 2X the object's width, draw the scanbox.
draw_self();
var range = sprite_width*2
if (distance_to_object(obj_player) < range && global.mapmode == false)
	draw_scanbox(self, percentScanned);