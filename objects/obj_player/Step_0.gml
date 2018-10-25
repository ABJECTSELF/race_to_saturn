/// @description Move probe
player_move()

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
if phy_speed > 10 && phy_linear_damping < 0.3
   {
   phy_linear_damping += 0.0001
   }
else
   {
   phy_linear_damping = 0.001;
   }
   