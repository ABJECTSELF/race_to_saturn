//collect_element(eID, amount);
/// @description Adds a number of an element to player's resources.
/// @param eID
/// @param amount
//NOTE: Negative amounts can be used to deduct resources as well.
var eID, amount;

eID = argument0;
amount = argument1;

if eID = "li"
	global.elem_li += amount;
else if eID = "au"
	global.elem_au += amount;
else if eID = "h"
	global.elem_h += amount;
else if eID = "al"
	global.elem_al += amount;
else if eID = "n"
	global.elem_n += amount;
else if eID = "o"
	global.elem_o += amount;
else if eID = "po"
	global.elem_po += amount;
else if eID = "xe"
	global.elem_xe += amount;
else return; //Invalid element ID. Do nothing.	