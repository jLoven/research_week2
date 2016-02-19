%  Jackie Loven, 18 February 2016

simple3DMatrix = zeros(10, 10, 10);
simple3DMatrix(:,:,1) = 5;
simple3DMatrix(:,:,10) = 5;
%disp(simple3DMatrix);
pillar3DMatrix = zeros(10, 10, 10);
pillar3DMatrix(:,:,1) = 1;
pillar3DMatrix(3,3,:) = 1;
pillar3DMatrix(3,3,:) = 4;
pillar3DMatrix(10,3,:) = 4;
pillar3DMatrix(6,3,:) = 4;
pillar3DMatrix(:,:,10) = 5;
%disp(pillar3DMatrix);

ballsize = 8;
[xx, yy, zz] = meshgrid(1:10,1:10,1:10);
[x1, y1, z1] = meshgrid(1:10,1:10,1:10);
scatter3(xx(:),yy(:),zz(:), ballsize, simple3DMatrix(:), 'filled')
scatter3(x1(:),y1(:),z1(:), ballsize, pillar3DMatrix(:), 'filled')