//Set Game Speed.
game_set_speed(120,gamespeed_fps);
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
global.mapmode = false;		//Whether the solar map is active.
global.max_dist = 7500;		//Maximum distance an entity can be from the player, in pixels.
global.max_ents = 30;		//Maximum number of entities that may be active at a time.
global.ents = 0;			//Current number of active entities in the area.
global.pulse = 100;			//Current number of Impulse charges
global.max_pulse = 100;		//Maximum number of Impulse charges.
global.p_target = 0;		//Current planet target
global.name = "Player"	//Player's name for scoreboard.
global.mouseTarget = obj_earth; //Targeted scan object.

	global.stars = 3000;		//Number of stars per second.
	global.orbit_circ = 1;		//Setting for orbit circles (0 = off, 1 = outline, 2 = full)
	global.scanbox_opn = 2;		//Setting for scan boxes (0 = always minimized, 1 = minimized after depletion, 2 = always open)
	global.difficulty = 2;		//Difficulty setting.
	global.volume_mus = 1;		//Volume for music.
	global.volume_sfx = 1;		//Volume for sound effects.

//Change game cursor.
cursor_sprite = spr_ring_green;
