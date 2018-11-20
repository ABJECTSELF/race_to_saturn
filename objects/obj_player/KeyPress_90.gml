/// @description Synthesize Power
//1 Hydrogen, 2 Gold, 2 Lithium
var h, au, li;
h = global.elem_h;	//Hydrogen
au = global.elem_au;//Gold
li = global.elem_li;//Lithium

if (h < 1 || au < 2 || li < 2) //Check that we have the minimum ingredients.
	return;

//Increase power.
global.pwr += 25;
if (global.pwr > global.prb_maxpwr)
	global.pwr = global.prb_maxpwr
	
//Subtract elements.
collect_element("h", -1);
collect_element("au", -2);
collect_element("li", -2);