//generate_elements(type, density)
/// @description Generates the elements that can be found on a planet.
/// @param type
/// @param density
/// @param size
var type, density, size, nRdm, elements, nMin, nMax, nSlots, sSlot, eID, nAmount, nCount, nVal;
type = argument0;	//The type of elements available.
density = argument1;//Density of the object.
size = argument2;	//Size of the object

elements= array_args("al", "au", "li", "po", "h", "n", "o", "xe");

//Create the array used to store element amounts on the object itself.
arrayElements = array_args(0, 0, 0, 0, 0);

if (type == "type_gas"){		//Gas giant, gas resources.
	nSlots = irandom_range(3,4);
	nMin = 4;
	nMax = 7;}

else if (type == "type_metal"){//Rocky planet, metal resources.
	nSlots = irandom_range(3,4);
	nMin = 0;
	nMax = 3;}
	
else if (type == "type_barren"){//Barren planet, all resources but limited.
	nSlots = irandom_range(1,3);
	nMin = 0;
	nMax = 7;}

else{
	nSlots = irandom_range(4,5);//Terrestrial or "other" planet, all resources and abundant.
	nMin = 0;
	nMax = 7;}

//Generate the total number of resources available on this planet based on density.
nAmount = ceil((size*0.0001)*density);

//Populate each available Slot with an appropriate element.
for (i = 1; i < nSlots; i++){
	sSlot = "eID_"+string(i);
	eID = elements[irandom_range(nMin, nMax)];
	variable_instance_set(self.id, sSlot, eID);	
}

//Split available resources between each element.
nCount = 0;
nVal = 0;
while (nCount < nAmount){
	nVal = irandom(nSlots-1);
	arrayElements[nVal] += 1;
	nCount++ 

}

