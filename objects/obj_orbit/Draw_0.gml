/// @description Insert description here
// You can write your code in this editor
var source = instance_find(p_id, 0);

draw_set_alpha(orb_alpha);
draw_circle_color(source.x, source.y, source.sprite_width, source.color1, source.color2, 0);
draw_set_alpha(1);
