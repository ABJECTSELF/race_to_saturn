/// @description Close map
view_visible[1] = false;
view_visible[0] = true;
global.mapmode = false;
var background = layer_background_get_id(layer_get_id("lyr_bg_black"));
layer_background_visible(background, false);