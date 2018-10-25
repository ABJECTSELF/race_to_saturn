//calculate_score(hasWonGame)
//Calculates and stores the player's final score.
var p_score, p_time, t_factor, s_bonus, p_power, p_fuel, p_impulse;

//Default bonus values. If player lost the game, use these values.
p_power = 0;
p_fuel = 0;
p_impulse = 0;
s_bonus = 0;
t_factor = 1;

if argument0 == true{	//If the player won the game.
	s_bonus = 10000; //Player gets a 10000 point bonus for winning.
	p_time = obj_ui.game_time_second + (obj_ui.game_time_minute*60); //Total up the game time in seconds.
	t_factor = p_time * .01; //Reduce time elapse to 1%
							//so that a time (in seconds) of 300 becomes a factor of 3.
	p_power = global.pwr * 10;		//Player's final power bonus.
	p_fuel = global.fuel * 10;		//Player's final fuel bonus.
	p_impulse = global.pulse * 100; //player's final impulse bonus.
}

p_score = (score + s_bonus + p_power + p_fuel + p_impulse)*global.difficulty; //Add up score values
																				//and multiply by difficulty.

score = (p_score - (obj_player.fuel_used * 10))/t_factor; //Reduce score by fuel used
															//and divide by time factor.

with (obj_ui)	//Record final time as a string.
	game_time_final = string(game_time_minute) + ":" + string(game_time_second);
