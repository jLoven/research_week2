%  Jackie Loven, 23 February 2016

ballsize = 8;
[xx, yy, zz] = meshgrid(1:10,1:10,1:10);

%  Testing 0 seeds:
simple4DMatrix = ones(10, 10, 10, 11);
simple4DMatrix(:,:,1, 1) = 6;
simple4DMatrix(:,:,10, 1) = 8;

pillar4DMatrix = zeros(10, 10, 10, 11);
pillar4DMatrix(:,:,1, 1) = 6;
pillar4DMatrix(3,3,:, 1) = 2;
pillar4DMatrix(3,3,:, 1) = 4;
pillar4DMatrix(10,3,:, 1) = 4;
pillar4DMatrix(6,3,:, 1) = 4;
myMatrix = generate_random_array(simple3DMatrix, pillar3DMatrix, 10, 0, 0);

%  Testing random seeds:
matrix1 = ones(10, 10, 10, 11);
matrix2 = zeros(10, 10, 10, 11);
randSeededMatrix = generate_random_array(matrix1, matrix2, 5, 2, 30);

%  Testing given seeds:
givenSeededMatrix = generate_random_array(matrix1, matrix2, 5, [2,2,2; 10,10,10], 30);
givenSeededMatrix3D = givenSeededMatrix(:, :, :, 1);
scatter3(xx(:),yy(:),zz(:), ballsize, givenSeededMatrix3D(:), 'filled')