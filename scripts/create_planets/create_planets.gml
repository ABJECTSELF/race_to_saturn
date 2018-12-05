///create_planets()
//This script generates planets in the solar system at a random angle relative to where Earth was created.
//The result should be that Earth and Saturn are on opposite edges of the map.
var planet = planetList;
var p_layer = "Instances";
var xloc = 7500;
var yloc = 0;
var last_planet = obj_sun;
var p_angle = -100;

//Create the Sun at the very center of the solar system.
instance_create_layer(room_width/2, room_height/2, p_layer, obj_sun);

for (var i = 0; i < array_length_1d(planet); i++)
{
randomize();
xloc = xloc *1.30
//yloc = irandom_range(-500, 500);
p_angle = irandom_range(0, 359);
instance_create_layer(obj_sun.x + lengthdir_x(xloc, p_angle), obj_sun.y + lengthdir_y(xloc, p_angle),p_layer, planet[i]);
last_planet = planet[i];
}

//Create the player on top of Earth, facing up.
instance_create_layer(obj_earth.x, obj_earth.y - obj_earth.sprite_width/2, p_layer, obj_player);
obj_player.phy_rotation = 270;