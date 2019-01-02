/// @description Move probe
var linDamp = 0.001; //Default linear damping for probe.
var dampFactor = .05;//Maximum additional lindear damping for probe.
var spdPercent = 0;  //Current percent of speed that is above 10px/s.

player_move();

///Keep position updated for sounds.
audio_listener_position(x, y, 0);

//Expend power.
var p_use = global.prate;
if mouse_check_button(mb_left)
	p_use = p_use*2; //Double power consumption if laser is being fired.
global.pwr -= p_use; //Decrement power amount by global factor

if global.pwr <= 1 && end_game != true	//If out of power, game over.
	{
	global.fuel = 0;	
	end_game = true;
	alarm[3] = room_speed;
	}

//Update speed.
global.prb_speed = phy_speed * 10;

//Limit player propulsion after 10 pixels per second by increasing linear damping.
//This is to discourage the player from attempting to reach maximum speed with thrust alone.
spdPercent = (phy_speed - 10)/10;
if (phy_speed > 10)
   phy_linear_damping = linDamp+(dampFactor*spdPercent);///Limit by percentage of speed that is between 10-20.
else
	phy_linear_damping = linDamp;
   