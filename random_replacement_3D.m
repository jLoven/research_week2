%  Jackie Loven, 15 February 2016

%  Generate a list of random length (less than the number of elements in the matrix) of 3D vectors
%  Take from one matrix and put into another.
%  And a correlation factor to generate random vectors within the vicinity of a seed or several seeds (perhaps passed by the user?)


exampleMatrix = [3, 3, 5];

%  Tuner is an integer from 1 to 10. Scaled by this number, this function picks a random number of random sites to replace in the originalMatrix given sites in the newMatrix.

function originalMatrix = random_replacement_3D_draft(originalMatrix, newMatrix, tuner)
    maxVectorNumber = numel(originalMatrix);
    %  TODO: This is set for now, but should be tunable and random:
    numberOfReplacements = 20;
    %  Randperm creates an array of random, nonrepeated integers in the range specified and the length specified.
    %  Randi creates an array of specified size of random integers up to the specified max.
    replacementVectorMatrix = randi(numberOfReplacements, 3);
    %  For each set of three, find it in the new matrix and replace inside OriginalMatrix
    %  TODO: Correlation factor
    while replacementVectorMatrix.
        x = replacementVectorMatrix(1);
        y = replacementVectorMatrix(2);
        z = replacementVectorMatrix(3);
        if ( originalMatrix(x, y, z) != newMatrix(x, y, z)) 
            originalMatrix(x, y, z) = newMatrix(x, y, z);
        end
        replacementVectorMatrix = replacementVectorMatrix(4:end);
    end
end













