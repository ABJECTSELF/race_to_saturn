/// @description Play a random music track every 140 seconds.
var nSize = array_length_1d(bgm);
var nRdm = random(nSize)
while (nRdm == nPrevTrack)
	nRdm = random(nSize);

//Play the selected track at the current global music setting.
var mus = audio_play_sound(bgm[nRdm], 5, false);
audio_sound_gain(mus, global.volume_mus, 0);

//Store tracks
global.song = bgm[nRdm];
nPrevTrack = nRdm;

alarm[0] = room_speed*140;