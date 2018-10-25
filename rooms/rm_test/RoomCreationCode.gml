                                       
//Set Global variables.
global.menu_escape = false;	//Enable/disable escape menu.
global.prb_torque = 50;		//Player turning rate
global.prb_propel = 30;		//Player propulsion force.
global.prb_maxpwr = 100;	//Player's maxiumum power.
global.prb_maxfuel = 100;	//Player's maximum fuel.
global.pwr = 100;			//Player's current power.
global.fuel = 100;			//Player's current fuel.
global.frate = 0.01;		//Rate at which fuel is expended.
global.prate = 0.005;		//Rate at which power is expended.
global.mapmode = false;		//Whether the solar map is active.
global.max_dist = 10000;		//Maximum distance an entity can be from the player, in pixels.
global.max_ents = 30;		//Maximum number of entities that may be active at a time.
global.ents = 0;			//Current number of active entities in the area.
global.pulse = 9;			//Current number of Impulse charges
global.max_pulse = 9;		//Maximum number of Impulse charges.
global.p_target = 0;		//Current planet target

//The following delcares arrays used for other scripts.
global.planet = array_args(obj_mercury, obj_venus, obj_earth, obj_mars, obj_jupiter, obj_saturn); //Array of all target planets.
global.obstacles = array_args(obj_ufo, obj_comet_small, obj_comet_med, obj_comet_large, obj_hubble, obj_satellite); //Array of all obstacles
