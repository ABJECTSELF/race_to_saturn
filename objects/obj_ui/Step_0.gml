/// @description Insert description here
// You can write your code in this editor
if global.guide_alpha = 0.75
	alpha_dec = true;

if global.guide_alpha = 0.10
	alpha_dec = false;

if alpha_dec == true
	global.guide_alpha -= 0.005;

else
	global.guide_alpha += 0.005;