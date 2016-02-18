%  Jackie Loven, 18 February 2016

ballsize = 8;
[xx, yy, zz] = meshgrid(1:10,1:10,1:10);

%  Testing 0 seeds:
simple3DMatrix = ones(10, 10, 10);
simple3DMatrix(:,:,1) = 6;
simple3DMatrix(:,:,10) = 8;
%scatter3(xx(:),yy(:),zz(:), ballsize, simple3DMatrix(:), 'filled')
pillar3DMatrix = zeros(10, 10, 10);
pillar3DMatrix(:,:,1) = 6;
pillar3DMatrix(3,3,:) = 2;
pillar3DMatrix(3,3,:) = 4;
pillar3DMatrix(10,3,:) = 4;
pillar3DMatrix(6,3,:) = 4;
%scatter3(xx(:),yy(:),zz(:), ballsize, pillar3DMatrix(:), 'filled')
myMatrix = generate_random_array(simple3DMatrix, pillar3DMatrix, 10, 0, 0);
%scatter3(xx(:),yy(:),zz(:), ballsize, myMatrix(:), 'filled')

%  Testing random seeds:
matrix1 = ones(10, 10, 10);
%scatter3(xx(:),yy(:),zz(:), ballsize, simple3DMatrix(:), 'filled')
matrix2 = zeros(10, 10, 10);
%scatter3(xx(:),yy(:),zz(:), ballsize, pillar3DMatrix(:), 'filled')
randSeededMatrix = generate_random_array(matrix1, matrix2, 5, 2, 30);
%scatter3(xx(:),yy(:),zz(:), ballsize, randSeededMatrix(:), 'filled')

%  Testing given seeds:
givenSeededMatrix = generate_random_array(matrix1, matrix2, 5, [2,2,2; 10,10,10], 30);
scatter3(xx(:),yy(:),zz(:), ballsize, givenSeededMatrix(:), 'filled')
