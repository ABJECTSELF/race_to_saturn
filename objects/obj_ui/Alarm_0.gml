/// @description Timer
//Every second, add a second to the clock timer.
//If seconds have reached 60, increment minute and reset seconds.
if game_time_second < 60
	game_time_second++;
else{
	game_time_minute++;
	game_time_second = 0;
}

//Repeat for every second while the UI object exists.
alarm[0] = room_speed;