///write_scoreboard();
//This script creates and/or modifies a high score .ini file

var section, p_name, g_time, d_level, p_score, n_count;	//Set up the variables we need to record.

p_name = global.name;

g_time = obj_ui.game_time_final; //Get our recorded final time.

//Get difficulty value and convert it to difficulty name.
d_level = global.difficulty;
	if d_level = 1
		d_level = "Trial";
	if d_level = 2
		d_level = "Normal";
	if d_level = 3
		d_level = "Hard";
		
p_score = floor(score);	//Get our score and round it down.	


ini_open("rts_scores.ini");	//Open our ini file.

//We need to cycle through each player to find one that doesn't exist
//in order to locate where we should save this score in the ini.

n_count = 1;
section = "Player" + string(n_count); //Concatenate a section name.

while ini_section_exists(section){
	n_count++;
	section = "Player" + string(n_count); //Cycle through section names until we fid a new one.
}

ini_write_string(section, "Name", p_name);	//Save player's name
ini_write_string(section, "Time", g_time);	//Save recording final time.
ini_write_string(section, "Mode", d_level);	//Save difficulty level.
ini_write_real(section, "Score", p_score);	//Save final score, rounded to the nearest integer.

ini_close();	//Close the ini file.