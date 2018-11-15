//random_string(size);
//Create a string of random, jumbled characters and numbers of the length in argument0;

//First, create the characters that the string may consist of.
var alphabet = array_args("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",  
						"w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7",
						"8", "9", "0", "#", "%", "$", "!", "&", "<", ">", "/");

			
var alpha_size = array_length_1d(alphabet);//Length of alphabet array.
var string_size = argument0;				//Length of string to be created.
var sOutput = "";							//String to be returned.
var nIndex = 0;
//Use a for loop to generate the string.
for (var i = 0; i < string_size; i++){
	nIndex = irandom(alpha_size-1);
	sOutput += alphabet[nIndex];
	}

return sOutput;	