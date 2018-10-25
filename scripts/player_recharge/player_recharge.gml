///player_recharge()
var pmax = global.prb_maxpwr;	//Max power amount

if global.pwr < pmax{ //Check that we need power

	if global.pwr + 5 > pmax
		global.pwr = pmax;
	else
		global.pwr += 5;
}
