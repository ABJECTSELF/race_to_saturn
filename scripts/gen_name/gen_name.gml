//gen_name(type)
//Creates a randomized name for certain objects
//Planets, asteroids, etc.

var type = argument0; //The type of object, integer.
				/*
				0 = planet
				1 = asteroid
				*/
if (type = 1){ //Asteroid name	
	//Asteroids have a 3-digit random number, and a greek name.
	var num, symbol, symbolArray, sOutput;
	num = irandom_range(100, 999);
	symbolArray = array_args("Ceres", "Pallas", "Juno", "Vesta", "Eros", "Astraea",
								"Iris", "Metis", "Hygiea", "Irene", "Thetis", "Fortuna",
								"Psyche", "Bellona", "Leukothea");
	symbol = symbolArray[irandom(array_length_1d(symbolArray)-1)];
	
	sOutput = string(num) + " " + symbol;
	return sOutput;
}
							