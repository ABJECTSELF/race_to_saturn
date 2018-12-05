//// @description Reset Scan
//If player bumps into planet during scan,
//scan will reset at 0.
if (isScanning && !scanned){
	percentScanned = 0;
	orbit_angle = point_direction(x, y, obj_player.x, obj_player.y);
	orbit_zenith = false;
}