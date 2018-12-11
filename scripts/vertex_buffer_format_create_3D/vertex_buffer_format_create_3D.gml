///scr_create_vertex_format();

    vertex_format_begin();
    vertex_format_add_position_3d();
    vertex_format_add_normal();
    vertex_format_add_textcoord();
    vertex_format_add_colour();
    vf = vertex_format_end();
    
    return vf;
