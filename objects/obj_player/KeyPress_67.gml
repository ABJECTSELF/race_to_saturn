/// @description Synthesize Impulse
//2 Argon, 1 Polonium, 2 Xenon
var ar, po, xe;
ar = global.elem_ar;	//Argon
po = global.elem_po;	//Polonium
xe = global.elem_xe;	//Xenon

if (ar < 2 || po < 1 || xe < 2) //Check that we have the minimum ingredients.
	return;

//Increase impulse.
global.pulse += 1;
if (global.pulse > global.max_pulse)
	global.pulse = global.prb_maxfuel;
	
//Subtract elements.
collect_element("ar", -2);
collect_element("po", -1);
collect_element("xe", -2);