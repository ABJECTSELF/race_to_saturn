/// @description Synthesize Fuel
// 1 Hydrogen, 2 Nitrogen, 2 Oxygen
var h, n, o;
h = global.elem_h;	//Hydrogen
n = global.elem_n;	//Nitrogen
o = global.elem_o;	//Oxygen

if (h < 1 || n < 2 || o < 2) //Check that we have the minimum ingredients.
	return;

//Increase power.
global.fuel += 25;
if (global.fuel > global.prb_maxfuel)
	global.fuel = global.prb_maxfuel;
	
//Subtract elements.
collect_element("h", -1);
collect_element("n", -2);
collect_element("o", -2);