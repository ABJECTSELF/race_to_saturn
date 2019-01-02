/// @description Gather elements
//reset zapTimer;
zapTimer = false;

if (scanned == true){//Collect resources while available.
		if (arrayElements[0]) > 0{
			arrayElements[0] -= 1;
			collect_element(eID_1, 1);
		}
		if (arrayElements[1]) > 0{
			arrayElements[1] -= 1
			collect_element(eID_2, 1);
		}
		if (arrayElements[2]) > 0{
			arrayElements[2] -= 1
			collect_element(eID_3, 1);
		}
		if (arrayElements[3]) > 0{
			arrayElements[3] -= 1
			collect_element(eID_4, 1);
		}
		if (arrayElements[4]) > 0{
			arrayElements[4] -= 1
			collect_element(eID_5, 1);
		}		
}
//If dynamic scan boxes are on, minimize when resources are depleted.
if (global.scanbox_opn = 1 && scanbox_override == false){
	if (arrayElements[0] == 0 && arrayElements[1] == 0 && arrayElements[2] == 0 
		&& arrayElements[3] == 0 && arrayElements[4] == 0)
		window_min = 1;
}	