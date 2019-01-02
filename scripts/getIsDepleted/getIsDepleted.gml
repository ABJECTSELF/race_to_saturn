//getIsDepleted(planet)
/// @description Checks whether all resources have been collected from a planet.
/// @param planet
var planet = argument0;

if (planet.arrayElements[0] == 0 && planet.arrayElements[1] == 0 &&
	planet.arrayElements[2] == 0 && planet.arrayElements[3] == 0 &&
	planet.arrayElements[4] == 0)
	return true;
return false;	