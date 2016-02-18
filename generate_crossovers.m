%  Jackie Loven, 18 February 2016


%  A = [x, y, z, numberOfMatrices]
%  fittingFunction = [1 2 3 4 5];
%  tuner: integer 1..10
%  matrixList = [{matrix1} {matrix2} {matrix3} {matrix4} {matrix5}];

function newMatrixList = generate_crossovers(A, fittingFunction, tuner, matrixList)
    seeds = 10 - tuner;
    seedPercentage = 25;
    matrixList = [];
    for matrix = 1:A(4)
        %  Choose random matrices to crossover:
        newMatrix = generate_random_array(matrixList{randi(A(4)}, matrixList{randi(A(4)}, tuner, seeds, seedPercentage);
        %  Choose only the best matrix with random matrices:
        [maxFit,indexOfMaxFit] = max(fittingFunction(:));
        bestMatrix = matrixList{1, indexOfMaxFit};
        newMatrix = generate_random_array(matrixList{randi(A(4)}, bestMatrix, tuner, seeds, seedPercentage);
        %  Tune based on the fitting function:
        % TODO
        newMatrixList{1, matrix} = newMatrix;
    end
end