/// @description Synthesize Impulse
//2 Aluminum, 1 Polonium, 2 Xenon
var al, po, xe;
al = global.elem_al;	//Aluminum
po = global.elem_po;	//Polonium
xe = global.elem_xe;	//Xenon

if (al < 2 || po < 1 || xe < 2) //Check that we have the minimum ingredients.
	return;

//Increase impulse.
global.pulse += 1;
if (global.pulse > global.max_pulse)
	global.pulse = global.max_pulse;
	
//Subtract elements.
collect_element("al", -2);
collect_element("po", -1);
collect_element("xe", -2);