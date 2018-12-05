//draw_scanbox(target, percentScanned)
/// @description Draws the information window after scanning an object.
/// @param target Object which scanbox displays information from.
/// @param percentScanned How much scanning has been completed.
var target = argument0;
var percentScanned = argument1;

var myName = target.p_name;		//Name of object
var myType = target.p_type;		//Type of object (planet, asteroid, UFO, etc)
var mySize = target.p_size;		//Radius of object (in km)
var myDensity = target.p_density;//Density of object (Not equal to game-logic density)
var myGravity = target.p_grav;	//Gravity of object (Not equal to game-logic gravity)
var myTemp = target.p_temp;		//Surface temperature (Kelvin)
//var myElements = target.p_elements;//Three most common elements, chosen from array.
var isThreat = target.p_threatLevel;	//The level of threat this object poses. 0 for none, 1 for slight, 2 for high and 3 for max.
var myThreatType = target.p_threatType;	//The type of threat this object presents (temperature, unsafe surface, hostile intelligence, etc);

//First, get the default opacity.
//If the PC is outside orbital range, opacity decreases as player leaves object.
var range = sprite_width*2;
var orbit = sprite_width;
var distance = distance_to_object(obj_player);
var opacity = ((range - distance)/range)-1; //Add Opacity to each draw alpha to reduce visibility by percentage of distance.

//Get window coordinates relative to Player's location.
var plnt_angle = point_direction(obj_player.x, obj_player.y, target.x, target.y);
var originx = lengthdir_x(200, plnt_angle);
var originy = lengthdir_y(200, plnt_angle);
var c_size;

//Establish colors and format.
draw_set_color(c_black);
draw_set_font(fnt_menu);
draw_set_halign(fa_left);

//If object is not scanned, obscure with a circle and question mark.
if (target.scanned == false && target.isScanning == false)
	{
	draw_set_alpha(0.75+opacity);
	c_size = target.sprite_width/2;
	draw_circle(target.x, target.y, target.sprite_width/2, false);
	draw_set_alpha(1+opacity);
	draw_set_color(c_gray);
	draw_line(target.x, target.y, obj_player.x + originx, obj_player.y + originy);
	draw_text(obj_player.x + originx, obj_player.y + originy, "?");		
	return;
	}	

//If object is being scanned, shrink the obscuring circle to represent percentage of scan remaining.
if (target.scanned == false && target.isScanning == true){
	draw_set_alpha(0.75+opacity);
	c_size = (target.sprite_width/2)*(1-percentScanned);
	draw_circle(target.x, target.y, c_size, false);
}
draw_set_alpha(0.75+opacity);

//Draw only the name and percentage if box was minimized, then stop here.
if (target.window_min == true)
	{
	draw_set_color(c_black);
	draw_rectangle(obj_player.x + originx - 150,			
				obj_player.y + originy - 100,
				obj_player.x + originx + 150,
				obj_player.y + originy -50, false);			
	draw_set_color(c_white);
	draw_line(target.x, target.y, 
				obj_player.x + originx, 
				obj_player.y + originy-90);
	draw_set_alpha(1+opacity);
	if (percentScanned < .90 && target.scanned != true)
		draw_text(obj_player.x + originx-120, obj_player.y + originy-90, random_string(6));
	else	
		draw_text(obj_player.x + originx-120, obj_player.y + originy-90, myName); //Name
	draw_set_font(fnt_speed);
	if (target.scanned != true)
		draw_text(obj_player.x + originx + 80, obj_player.y + originy - 90, string(round(percentScanned*100))+"%");//Current scan percentage (rounded up).
	//Draw a GUI switch box in the top-right corner to allow player to minimize/maximize window.
	draw_GUIbox(obj_player.x + originx + 130, obj_player.y + originy - 80, 25, 25, "", spr_null, c_black, c_gray, true);
	if (point_in_rectangle(mouse_x, mouse_y, 
		obj_player.x + originx + 105, obj_player.y + originy - 105, 
		obj_player.x + originx + 155, obj_player.y + originy - 55) 
		&& (mouse_check_button_released(mb_left))){
			target.window_min = false;
			target.scanbox_override = true;}
	return;
	}
	
//Draw lines
draw_set_color(c_white);
//Lower left corner
if (obj_player.x + originx-150 > target.x || obj_player.y  + originy+110 < target.y){
	draw_line(target.x, target.y, 
			obj_player.x + originx-150, 
			obj_player.y + originy+110);
	}
//Upper right corner
if (obj_player.x + originx + 150 < target.x || obj_player.y + originy - 100 > target.y){
draw_line(target.x, target.y, 
			obj_player.x + originx + 150, 
			obj_player.y + originy - 100);
	}
//Upper left corner
if (obj_player.x + originx-150 > target.x || obj_player.y + originy - 100> target.y){
draw_line(target.x, target.y, 
			obj_player.x + originx-150, 
			obj_player.y + originy-100);
	}
//Lower right corner
if (obj_player.x + originx + 150 < target.x || obj_player.y + originy + 110 < target.y){
draw_line(target.x, target.y, 
			obj_player.x + originx + 150, 
			obj_player.y + originy + 110);
	}

//Draw the full box.
draw_set_color(c_black);
draw_rectangle(obj_player.x + originx + 150,			
				obj_player.y + originy - 100,
				obj_player.x + originx - 150,
				obj_player.y + originy + 110, false);

//Draw a GUI switch box in the top-right corner to allow player to minimize/maximize window.
draw_GUIbox(obj_player.x + originx + 130, obj_player.y + originy - 80, 25, 25, "", spr_null, c_black, c_gray, true);
if (point_in_rectangle(mouse_x, mouse_y, 
	obj_player.x + originx + 105, obj_player.y + originy - 105, 
	obj_player.x + originx + 155, obj_player.y + originy - 55) 
	&& (mouse_check_button_released(mb_left))){
		target.window_min = true;
		target.scanbox_override = true;}
	
//Populate box with information.
//Use center coordinates as a reference for location.
//Object name is in a large font, the rest are smaller.
//For each field, if scan is not past a certain threshold, a randomized string will display instead.
draw_set_font(fnt_menu);
//Use smaller font if name is too long.
if (string_length(myName) > 6)
	draw_set_font(fnt_menu_s);
draw_set_alpha(1+opacity);
draw_set_color(c_white);
draw_set_halign(fa_left);

if (percentScanned < .10 && target.scanned != true)
	draw_text(obj_player.x + originx-120, obj_player.y + originy-90, random_string(6));
else	
	draw_text(obj_player.x + originx-120, obj_player.y + originy-90, myName); //Name

draw_set_font(fnt_speed);

if (target.scanned != true)
	draw_text(obj_player.x + originx + 80, obj_player.y + originy - 90, string(round(percentScanned*100))+"%");//Current scan percentage (rounded up).

if (percentScanned < .20 && target.scanned != true)
	draw_text(obj_player.x + originx-140, obj_player.y + originy-55, random_string(10));
else
	draw_text(obj_player.x + originx-140, obj_player.y + originy-55, "Type: " + myType); //Type

if (percentScanned < .30 && target.scanned != true)
	draw_text(obj_player.x + originx-140, obj_player.y + originy-35, random_string(10));
else	
	draw_text(obj_player.x + originx-140, obj_player.y + originy-35, "Size: " + string(mySize) + "km");//Size

if (percentScanned < .40 && target.scanned != true)
	draw_text(obj_player.x + originx-140, obj_player.y + originy-15, random_string(10));
else
	draw_text(obj_player.x + originx-140, obj_player.y + originy-15, "Density: " + string(myDensity) + "g/cm^3");//Density

if (percentScanned < .60 && target.scanned != true)
	draw_text(obj_player.x + originx-140, obj_player.y + originy+05, random_string(10));
else
	draw_text(obj_player.x + originx-140, obj_player.y + originy+05, "Gravity: " + string(myGravity) + "m/s^2");//Gravity

if (percentScanned < .70 && target.scanned != true)
	draw_text(obj_player.x + originx-140, obj_player.y + originy+25, random_string(10));
else
	draw_text(obj_player.x + originx-140, obj_player.y + originy+25, "Surface Temp: " + string(myTemp) + "K");//Temp

//Determine color for threat type by threat level.
switch (isThreat){
	case 0: break;
	case 1: draw_set_color(c_olive); break;
	case 2: draw_set_color(c_orange); break;
	case 3: draw_set_color(c_red); break;
	}
if (percentScanned < .85 && target.scanned != true)
	draw_text(obj_player.x + originx-140, obj_player.y + originy+45, random_string(6));
else	
	draw_text(obj_player.x + originx-140, obj_player.y + originy+45, "Hazard: " + myThreatType);//Threat
	
if (percentScanned < 1 && target.scanned != true)
	draw_text(obj_player.x + originx-140, obj_player.y + originy+65, random_string(10));
else{
	draw_text(obj_player.x + originx-140, obj_player.y + originy+65, "Elements: ");//Elements
	//From here we draw the element icons based on what elements and amounts are stored on this object.
	draw_element(obj_player.x + originx-30, obj_player.y + originy+85,	target.eID_1, target.eValue_1);
	draw_element(obj_player.x + originx + 10, obj_player.y + originy+85,	target.eID_2, target.eValue_2); 
	draw_element(obj_player.x + originx+50, obj_player.y + originy+85,	target.eID_3, target.eValue_3);
	draw_element(obj_player.x + originx+90, obj_player.y + originy+85,	target.eID_4, target.eValue_4);//Note: This slot may be blank on most planets
	draw_element(obj_player.x + originx+130, obj_player.y + originy+85,	target.eID_5, target.eValue_5);//Note: This slot may be blank on most planets.
	}	