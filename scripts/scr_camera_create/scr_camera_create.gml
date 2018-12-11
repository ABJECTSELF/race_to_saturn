///scr_camera_create(x,y,z, speed);

gpu_set_texfilter(true);
gpu_set_texrepeat(true);
gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);
gpu_set_cullmode(cull_counterclockwise);

draw_set_colour(c_white);

bearing = 0;
pitch = 0;
vector_x = 0;
vector_y = 0;
vector_z = 0;

view_enabled = true;
view_visible[0] = true;
view_xport[0]= 0;
view_yport[0]= 0;
view_wport[0]= 1366;
view_hport[0]= 768;
view_camera[0] = camera_create();

x = argument0;
y = argument1;
cam_z = argument2;

max_speed = argument3;

znear = 1;
zfar = 32000;
fov = 80;
aspect = view_wport[0] / view_hport[0];

//FOV and aspect must be invesrse for a Z up projection to work correctly (WTF)
projmat = matrix_build_projection_perspective_fov(-fov, -aspect, znear, zfar);

camera_set_proj_mat(view_camera[0], projmat);