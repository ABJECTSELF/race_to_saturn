//fade_screen(alpha)
/// @description Instantly creates a black screen over the player's view.
/// @param alpha
var nAlpha = argument0;

draw_set_color(c_black);
draw_set_alpha(nAlpha);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);