/// @description Play a random music track every 140 seconds.
var nSize = array_length_1d(bgm);
var nRdm = random(nSize)
while (nRdm == nPrevTrack)
	nRdm = random(nSize);
	
audio_play_sound(bgm[nRdm], 5, false);
nPrevTrack = nRdm;

alarm[0] = room_speed*140;