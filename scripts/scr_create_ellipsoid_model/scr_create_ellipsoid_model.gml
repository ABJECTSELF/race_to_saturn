///scr_create_ellipsoid_model(x1,y1,z1,x2,y2,z2,steps,invert,hrepeat,vrepeat,bacTexture);

vertex_format = vertex_buffer_format_create_3D();
vertex_buffer = vertex_create_buffer();

vertex_begin(vertex_buffer, vertex_format);
    vertex_buffer_ellipsoid_3D(vertex_buffer,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);
vertex_end(vertex_buffer);
vertex_freeze(vertex_buffer);

vertex_texture = sprite_get_texture(argument10, -1);

return vertex_buffer;
