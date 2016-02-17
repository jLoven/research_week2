% Jackie Loven, 16 February 2016

%  seeds is EITHER a matrix, n * 3, in which you can input a serious of 3D coordinates,
%  OR a number of seeds for this function to randomly generate itself.
%  seedPercentage is the percentage of replacements that will be alotted to each seed.
%  The remainder of replacements not allotted to seeds will be randomly placed.
%  Tuner goes from 1 to 10. 10 is fewer random replacements and more correlated.
%  1 is more random replacements and less correlated.

function originalMatrix = generate_random_array(originalMatrix, newMatrix, tuner, seeds, seedPercentage)
    
    originalXMax = size(originalMatrix, 1);
    originalYMax = size(originalMatrix, 2);
    originalZMax = size(originalMatrix, 3);

    maxReplacementCount = originalXMax * originalYMax * originalZMax;
    replacementFraction = 1 - (tuner/11); %  TODO: random for now, should be tunable.
    replacementCount = randi(round(maxReplacementCount * replacementFraction));
    correlatedReplacementCount = ((seedCount * seedPercentage) / 100) * replacementCount;
    uncorrelatedReplacementCount = replacementCount - correlatedReplacementCount;

    if (size(seeds) == [1, 1]) %  Determine whether seeds are provided.
        assert((seeds * seedPercentage <= 100), 'Choose fewer seeds or a lower percentage of changes alotted per seed.');
        seedCount = round((1 - replacementFraction) * seeds);
        seedXCoordinateList = randi(originalXMax, [1, correlatedReplacementCount]);
        seedYCoordinateList = randi(originalYMax, [1, correlatedReplacementCount]);
        seedZCoordinateList = randi(originalZMax, [1, correlatedReplacementCount]);
        seeds = horzcat(seedXCoordinateList, seedYCoordinateList, seedZCoordinateList);
    else
        seedCount = size(seeds, 1);
    end

    %  For each dimension of the matrix, make a new randi vector
    uncorrelatedXCoordinateList = randi(originalXMax, [1, uncorrelatedReplacementCount]);
    uncorrelatedYCoordinateList = randi(originalYMax, [1, uncorrelatedReplacementCount]);
    uncorrelatedZCoordinateList = randi(originalZMax, [1, uncorrelatedReplacementCount]);
    
    %  Now arrange the rest of the replacements within a tunable vicinity from the given seeds according to percentages:
    %  for each given seed (either in seed matrix given or the one created, make a new series of coordinateLists:
    %  the x must be between [seed.x - (tuner / 11)..... TODO: DETERMINE
    %  TODO: For each seed, x-range should be within ±x of the seed's x, but should also be within the bounds of the original matrix. So if the lower is less than 0, replace with 0, and if the upper is greater than originalXMax then replace with originalXMax:
    replacementsPerSeed = round(correlatedReplacementCount / seedCount);
    
    
    for element = 1:uncorrelatedReplacementCount;
        x = uncorrelatedXCoordinateList(1, element);
        y = uncorrelatedYCoordinateList(1, element);
        z = uncorrelatedZCoordinateList(1, element);
        if (originalMatrix(x, y, z) != newMatrix(x, y, z)) 
            originalMatrix(x, y, z) = newMatrix(x, y, z);
        end
    end
end







