//Stop current sounds.
audio_stop_all();
//Play music.
audio_play_sound(mus_landsea, 5, false);
//Set Global variables.
global.menu_type = 0;		//Main menu mode.
global.menu_escape = false;	//Enable/disable escape menu.
global.menu_gameover = false;//Enable game over screen;
global.menu_won = false;	//Enable victory screen.
global.prb_torque = 50;		//Player turning rate
global.prb_propel = 30;		//Player propulsion force.
global.prb_maxpwr = 100;	//Player's maxiumum power.
global.prb_maxfuel = 100;	//Player's maximum fuel.
global.pwr = 100;			//Player's current power.
global.fuel = 100;			//Player's current fuel.
global.frate = 0;		//Rate at which fuel is expended.
global.prate = 0;		//Rate at which power is expended.
global.pulse = 100;			//Current number of Impulse charges
global.max_pulse = 100;		//Maximum number of Impulse charges.

//Reset Element inventory.
global.elem_au = clamp(3, 0, 99);
global.elem_h = clamp(6, 0, 99);;
global.elem_li = clamp(3, 0, 99);;
global.elem_al = clamp(3, 0, 99);;
global.elem_n = clamp(3, 0, 99);;
global.elem_o = clamp(3, 0, 99);;
global.elem_po = clamp(3, 0, 99);;
global.elem_xe = clamp(3, 0, 99);;

	global.song = mus_landsea;	//The currently-active music track;
