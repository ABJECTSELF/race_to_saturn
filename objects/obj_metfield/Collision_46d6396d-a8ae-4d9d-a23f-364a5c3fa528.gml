/// @description Reduce player speed.
//Debris field don't damage or repel the player, but add friction to movement speed.

image_blend = c_red;

//Shake the camera
with (obj_camera) shake = global.prb_speed/2;

//Slow the player
with (obj_player){
	phy_linear_damping = 100000;
}