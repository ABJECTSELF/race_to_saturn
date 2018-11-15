/// @description Synthesize Power
//1 Hydrogen, 2 Magnesium, 2 Helium
var h, mg, he;
h = global.elem_h;	//Hydrogen
mg = global.elem_mg;//Magnesium
he = global.elem_he;//Helium

if (h < 1 || mg < 2 || he < 2) //Check that we have the minimum ingredients.
	return;

//Increase power.
global.pwr += 25;
if (global.pwr > global.prb_maxpwr)
	global.pwr = global.prb_maxpwr
	
//Subtract elements.
collect_element("h", -1);
collect_element("mg", -2);
collect_element("he", -2);