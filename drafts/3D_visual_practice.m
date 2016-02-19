%  Jackie Loven, 15 February 2016

%  Make a 2D surface:
[x, y] = meshgrid(-3:0.1:3);
f = x.*exp(- x.^2 - y.^2);
surf(x, y, f);

%  Low-res show:
clear f x y z
[x, y, z] = meshgrid([-1 0 1]);
v = x.*exp(- x.^2 - y.^2 - z.^2);
scatter3(x(:), y(:), z(:), [], z(:));

%  Higher-res show:
clear f x y z
[x, y, z] = meshgrid(-3:0.25:3);
v = x.*exp(- x.^2 - y.^2 - z.^2);
scatter3(x(:), y(:), z(:), [], z(:))

%  Plane where z = 0, no plane with respect to x- and y- coordinates. See shape of peak and trough that scatter3 didn't:
slice(x, y, z, v, [], [], 0);

%  Different slice planes, and peak and trough have 3D shape:
slice(x, y, z, v, [], 0, 0);

%  Use vector to draw two planes with respect to x, but now slices obscure the interesting parts of the functions like in scatter3:
slice(x, y, z, v, [-1.5, 1.5], 0, 0);

%  Can define any surface for the slice:
[xs, ys] = meshgrid(-3:0.1:3);
zs = -xs + ys;
slice(x, y, z, v, xs, ys, zs);

zs = sin(xs) -cos(ys);
slice(x, y, z, v, xs, ys, zs);

%  Octave doesn't have contourslice:
%contourslice(x, y, z, v, [], [], 0, 20)
%contourslice(x, y, z, v, [], 0, [-1 1], 10)

%  Surface where function takes value 1e-5, this could be really useful for visualizing certain material structures within the cell:
isosurface(x, y, z, v, 1e-5);
isosurface(x, y, z, v, -1e-4);






