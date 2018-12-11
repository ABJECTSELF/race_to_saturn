///scr_camera_draw
bearing -= (display_mouse_get_x() - display_get_width()/2)/10;
pitch += (display_mouse_get_y() - display_get_height()/2)/10;
pitch = max(min(pitch,88),-88);
  
ss = sin(degtorad(bearing));
cc = cos(degtorad(bearing));
    
vector_x = cc*cos(degtorad(-pitch));
vector_y = ss*-cos(degtorad(-pitch));
vector_z = sin(degtorad(-pitch));


viewmat = matrix_build_lookat(x,y,cam_z, x+vector_x,y+vector_y,cam_z+vector_z, 0,0,1);

camera_set_view_mat(view_camera[0], viewmat);
camera_apply(view_camera[0]);

display_mouse_set(display_get_width()/2,display_get_height()/2);