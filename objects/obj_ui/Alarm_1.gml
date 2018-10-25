/// @description Fuel/Power Alert
//Alert sound plays if either fuel or power go below 25%

if (global.fuel < 25 || global.pwr < 25)
	audio_play_sound(sfx_alert, 1, false);
	
alarm[1] = room_speed*2;