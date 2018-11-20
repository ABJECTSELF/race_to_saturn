/// @description Gather elements
if (scanned == true){//Collect resources while available.
		if (eValue_1) > 0{
			eValue_1--
			collect_element(eID_1, 1);
		}
		if (eValue_2) > 0{
			eValue_2--
			collect_element(eID_2, 1);
		}
		if (eValue_3) > 0{
			eValue_3--
			collect_element(eID_3, 1);
		}
		if (eValue_4) > 0{
			eValue_4--
			collect_element(eID_4, 1);
		}
		if (eValue_5) > 0{
			eValue_5--
			collect_element(eID_5, 1);
		}		
}
//If dynamic scan boxes are on, minimize when resources are depleted.
if (global.scanbox_opn = 1 && scanbox_override == false){
	if (eValue_1 == 0 && eValue_2 == 0 && eValue_3 == 0 && eValue_4 == 0 && eValue_5 == 0)
		window_min = 1;
}	