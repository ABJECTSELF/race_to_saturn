///scr_draw_vertex_buffer_trianglelist(bufferIndex,x,y,z,rotx,roty,rotz);

/* //OLD METHOD OF DOING ROTATIONS AND TRANSLATIONS
d3d_transform_set_identity()
d3d_transform_add_rotation_x(argument4)
d3d_transform_add_rotation_y(argument5)
d3d_transform_add_rotation_z(argument6)

d3d_transform_add_translation(argument1, argument2, argument3)
vertex_submit(argument0, pr_trianglelist, vertex_texture);
d3d_transform_set_identity();
*/

//NEW METHOD USING MATRIX FUNCTIONS
mat_rotate_translate = matrix_build(argument1,argument2,argument3,argument4,argument5,argument6,1,1,1);
matrix_set(matrix_world, mat_rotate_translate);
    vertex_submit(argument0, pr_trianglelist, vertex_texture);   
matrix_set(matrix_world, matrix_build_identity());
