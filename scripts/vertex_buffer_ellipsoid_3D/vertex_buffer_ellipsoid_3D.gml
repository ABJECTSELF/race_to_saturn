///vertex_buffer_ellipsoid_3D(ind,x1,y1,z1,x2,y2,z2,steps,invert,hrepeat,vrepeat);
//Uses vertex buffers, which are faster than the old d3d model, and easier on the RAM.
var ind=argument0;
var x1=argument1;
var y1=argument2;
var z1=argument3;
var x2=argument4;
var y2=argument5;
var z2=argument6;
var steps=argument7;
var invert=argument8;
var hrepeat=argument9;
var vrepeat=argument10;

var xx=(x1+x2)/2;
var yy=(y1+y2)/2;
var zz=(z1+z2)/2;

var xl=x2-xx;
var yl=y2-yy;
var zl=z2-zz;

var a=(2*pi)/steps;
var b;
var c;

if !invert
{
    for(i=0;i<2*pi;i+=a)
    {
        for(j=0;j<pi;j+=a)
        {
            if j<pi/2{b= j   /pi}else{b=1- j   /pi}
            if j<pi/2{c=(j+a)/pi}else{c=1-(j+a)/pi}
            vertex_buffer_triangle_3D(ind,xx+xl*cos(i)  *sin(j),  yy+yl*sin(i)  *sin(j),  zz+zl*cos(j),
                                xx+xl*cos(i)  *sin(j+a),yy+yl*sin(i)  *sin(j+a),zz+zl*cos(j+a),
                                xx+xl*cos(i+a)*sin(j),  yy+yl*sin(i+a)*sin(j),  zz+zl*cos(j),
                                0.5+0.5*cos(i)  *b*2*hrepeat,0.5+0.5*sin(i)  *b*2*vrepeat,
                                0.5+0.5*cos(i)  *c*2*hrepeat,0.5+0.5*sin(i)  *c*2*vrepeat,
                                0.5+0.5*cos(i+a)*b*2*hrepeat,0.5+0.5*sin(i+a)*b*2*vrepeat)
            vertex_buffer_triangle_3D(ind,xx+xl*cos(i)  *sin(j+a),yy+yl*sin(i)  *sin(j+a),zz+zl*cos(j+a),
                                xx+xl*cos(i+a)*sin(j+a),yy+yl*sin(i+a)*sin(j+a),zz+zl*cos(j+a),
                                xx+xl*cos(i+a)*sin(j),  yy+yl*sin(i+a)*sin(j),  zz+zl*cos(j),
                                0.5+0.5*cos(i)  *c*2*hrepeat,0.5+0.5*sin(i)  *c*2*vrepeat,
                                0.5+0.5*cos(i+a)*c*2*hrepeat,0.5+0.5*sin(i+a)*c*2*vrepeat,
                                0.5+0.5*cos(i+a)*b*2*hrepeat,0.5+0.5*sin(i+a)*b*2*vrepeat)
        }
    }
}
else
{
    for(i=0;i<2*pi;i+=a)
    {
        for(j=0;j<pi;j+=a)
        {
            if j<pi/2{b= j   /pi}else{b=1- j   /pi}
            if j<pi/2{c=(j+a)/pi}else{c=1-(j+a)/pi}
            vertex_buffer_triangle_3D(ind,xx+xl*cos(i)  *sin(j),  yy-yl*sin(i)  *sin(j),  zz+zl*cos(j),
                                xx+xl*cos(i)  *sin(j+a),yy-yl*sin(i)  *sin(j+a),zz+zl*cos(j+a),
                                xx+xl*cos(i+a)*sin(j),  yy-yl*sin(i+a)*sin(j),  zz+zl*cos(j),
                                0.5+0.5*cos(i)  *b*2*hrepeat,0.5+0.5*sin(i)  *b*2*vrepeat,
                                0.5+0.5*cos(i)  *c*2*hrepeat,0.5+0.5*sin(i)  *c*2*vrepeat,
                                0.5+0.5*cos(i+a)*b*2*hrepeat,0.5+0.5*sin(i+a)*b*2*vrepeat)
            vertex_buffer_triangle_3D(ind,xx+xl*cos(i)  *sin(j+a),yy-yl*sin(i)  *sin(j+a),zz+zl*cos(j+a),
                                xx+xl*cos(i+a)*sin(j+a),yy-yl*sin(i+a)*sin(j+a),zz+zl*cos(j+a),
                                xx+xl*cos(i+a)*sin(j),  yy-yl*sin(i+a)*sin(j),  zz+zl*cos(j),
                                0.5+0.5*cos(i)  *c*2*hrepeat,0.5+0.5*sin(i)  *c*2*vrepeat,
                                0.5+0.5*cos(i+a)*c*2*hrepeat,0.5+0.5*sin(i+a)*c*2*vrepeat,
                                0.5+0.5*cos(i+a)*b*2*hrepeat,0.5+0.5*sin(i+a)*b*2*vrepeat)
        }
    }
}
