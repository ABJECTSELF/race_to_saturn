/// @description Move probe
player_move();

///Keep position updated for sounds.
audio_listener_position(x, y, 0);

//Expend power.
var p_use = global.prate;
global.pwr -= p_use; //Decrement power amount by global factor

if global.pwr <= 1 && end_game != true	//If out of power, game over.
	{
	global.fuel = 0;	
	end_game = true;
	alarm[3] = room_speed;
	}

//Update speed.
global.prb_speed = phy_speed * 10;

//Limit player propulsion after 10 pixels per second
//Make sure player is not facing the opposite direction of motion so they can still slow down.
var angleDif = angle_difference(phy_rotation, point_direction(0, 0, phy_speed_x, phy_speed_y));
if (phy_speed > 10 	&& (angleDif < -90	|| angleDif > 90))
   global.prb_propel = 30*(1-(phy_speed - 10)/10);///Limit by percentage of speed that is between 10-20.
else
	global.prb_propel = 30;
   