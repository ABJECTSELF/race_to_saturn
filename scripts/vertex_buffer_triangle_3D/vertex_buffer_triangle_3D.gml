///vertex_buffer_triangle_3D(vbuff,x1,y1,z1,x2,y2,z2,x3,y3,z3,tx1,ty1,tx2,ty2,tx3,ty3)
var nx, ny, nz, nl;
var za,zb,zc,xa,xb,xc,ya,yb,yc;

buffer = argument0;
xa = argument1;
ya = argument2;
za = argument3;

xb = argument4;
yb = argument5;
zb = argument6;

xc = argument7;
yc = argument8;
zc = argument9;

nx = (za-zb)*(yc-yb)-(ya-yb)*(zc-zb);
ny = (xa-xb)*(zc-zb)-(za-zb)*(xc-xb);
nz = (ya-yb)*(xc-xb)-(xa-xb)*(yc-yb);

vertex_position_3d(buffer,xa,ya,za);
    vertex_normal(buffer,nx,ny,nz);
    vertex_texcoord(buffer,argument10,argument11);
    vertex_colour(buffer,c_white,1);
    
vertex_position_3d(buffer,xb,yb,zb);
    vertex_normal(buffer,nx,ny,nz);
    vertex_texcoord(buffer,argument12,argument13);
    vertex_colour(buffer,c_white,1);

vertex_position_3d(buffer,xc,yc,zc);
    vertex_normal(buffer,nx,ny,nz);
    vertex_texcoord(buffer,argument14,argument15);
    vertex_colour(buffer,c_white,1);
