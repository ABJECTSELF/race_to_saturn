/// @description set HUD parameters
global.prb_speed = 0;
global.guide_alpha = 0.75;
alpha_dec = true;
game_over = false;
game_won = false;
game_time_second = 0;
game_time_minute = 0;

//Start timer
alarm[0] = room_speed;

//Start alert alarm;
alarm[1] = room_speed;