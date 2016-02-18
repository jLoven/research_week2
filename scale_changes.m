%  Jackie Loven, 18 February 2016

%  For example, make 5 random matrices of size 10x10x10 given this input to simulate getting 5 such matrices.
matrix1 = ones(10, 10, 10);
matrix2 = ones(10, 10, 10) * 2;
matrix3 = ones(10, 10, 10) * 3;
matrix4 = ones(10, 10, 10) * 4;
matrix5 = ones(10, 10, 10) * 5;

%matrixList = [{matrix1}, {matrix2}, {matrix3}, {matrix4}, {matrix5}];
matrixList = {matrix1, matrix2, matrix3, matrix4, matrix5};

%  Assume matrix sizes are all the same.
x = size(matrixList{1, 1}, 1);
y = size(matrixList{1, 1}, 2);
z = size(matrixList{1, 1}, 3);
number = size(matrixList, 2);
A = [x, y, z, number];

%  There will be an associated fitting function per matrix:
fittingFunction = [1 4 3 2 5];

%  The function I write looks like
%  func(A, fittingFactor, tuner)
generatedMatrixList = generate_crossovers(A, fittingFunction, 5, matrixList);

matrix = generatedMatrixList{1,3};

ballsize = 8;
[xx, yy, zz] = meshgrid(1:10,1:10,1:10);
%scatter3(xx(:),yy(:),zz(:), ballsize, matrix(:), 'filled')
for matrix = 1:number
    scatter3(xx(:),yy(:),zz(:), ballsize, generatedMatrixList{1, matrix}(:), 'filled')
end








