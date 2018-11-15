//collect_element(eID, amount);
//Adds a number of an element to player's resources.
//NOTE: Negative amounts can be used to deduct resources as well.
var eID, amount;

eID = argument0;
amount = argument1;

if eID = "ar"
	global.elem_ar += amount;
else if eID = "he"
	global.elem_he += amount;
else if eID = "h"
	global.elem_h += amount;
else if eID = "mg"
	global.elem_mg += amount;
else if eID = "n"
	global.elem_n += amount;
else if eID = "o"
	global.elem_o += amount;
else if eID = "po"
	global.elem_po += amount;
else if eID = "xe"
	global.elem_xe += amount;
else return; //Invalid element ID. Do nothing.	