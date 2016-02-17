% Jackie Loven, 17 February 2016

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
    %  If tuner is large, replacementFraction must be small:
    replacementFraction = 1 - (tuner/11); %  TODO: random for now, should be tunable.
    replacementCount = randi(round(maxReplacementCount * replacementFraction));
    correlatedReplacementCount = ((seedCount * seedPercentage) / 100) * replacementCount;
    uncorrelatedReplacementCount = replacementCount - correlatedReplacementCount;

    if (size(seeds) == [1, 1]) %  Determine whether seeds are provided.
        assert((seeds * seedPercentage <= 100), 'Choose fewer seeds or a lower percentage of changes alotted per seed.');
        seedXCoordinateList = randi(originalXMax, [correlatedReplacementCount, 1]);
        seedYCoordinateList = randi(originalYMax, [correlatedReplacementCount, 1]);
        seedZCoordinateList = randi(originalZMax, [correlatedReplacementCount, 1]);
        seeds = horzcat(seedXCoordinateList, seedYCoordinateList, seedZCoordinateList);
    end

    seedCount = size(seeds, 1);

    uncorrelatedXCoordinateList = randi(originalXMax, [uncorrelatedReplacementCount, 1]);
    uncorrelatedYCoordinateList = randi(originalYMax, [uncorrelatedReplacementCount, 1]);
    uncorrelatedZCoordinateList = randi(originalZMax, [uncorrelatedReplacementCount, 1]);
    uncorrelatedCoordinateMatrix = horzcat(uncorrelatedXCoordinateList, uncorrelatedYCoordinateList, uncorrelatedZCoordinateList);
    
    replacementsPerSeed = round(correlatedReplacementCount / seedCount);
    for seed = 1:seedCount
        seedXMinBound = seeds(seed, 1) - (replacementFraction * originalXMax);
        seedXMaxBound = seeds(seed, 1) + (replacementFraction * originalXMax);
        seedYMinBound = seeds(seed, 2) - (replacementFraction * originalYMax);
        seedYMaxBound = seeds(seed, 2) + (replacementFraction * originalYMax);
        seedZMinBound = seeds(seed, 3) - (replacementFraction * originalZMax);
        seedZMaxBound = seeds(seed, 3) + (replacementFraction * originalZMax);
        
        seedXMinBoundList(seed, 1) = seedXMinBound;
        seedXMaxBoundList(seed, 1) = seedXMaxBound;
        seedYMinBoundList(seed, 1) = seedYMinBound;
        seedYMaxBoundList(seed, 1) = seedYMaxBound;
        seedZMinBoundList(seed, 1) = seedZMinBound;
        seedZMaxBoundList(seed, 1) = seedZMaxBound;
        
        %  Make sure they're in the matrix:
        %  min() brings up to a level -> 1
        %  max() brings down to a level -> originalMax
        seedXMinBoundList = max(seedXMinBoundList, 1);
        seedXMaxBoundList = min(seedXMaxBoundList, originalXMax);
        seedYMinBoundList = max(seedYMinBoundList, 1);
        seedYMaxBoundList = min(seedYMaxBoundList, originalYMax);
        seedZMinBoundList = max(seedZMinBoundList, 1);
        seedZMaxBoundList = min(seedZMaxBoundList, originalZMax);
        
        correlatedCoordinateRangesMatrix = horzcat(seedXMinBoundList, seedXMaxBoundList, seedYMinBoundList, seedYMaxBoundList, seedZMinBoundList, seedZMaxBoundList);
    end
    
    %  TODO: make correlated coordinate matrix
    
    for uncorrelatedElement = 1:size(uncorrelatedCoordinateMatrix, 1);
        x = uncorrelatedCoordinateMatrix(uncorrelatedElement, 1);
        y = uncorrelatedCoordinateMatrix(uncorrelatedElement, 2);
        z = uncorrelatedCoordinateMatrix(uncorrelatedElement, 3);
        if (originalMatrix(x, y, z) != newMatrix(x, y, z)) 
            originalMatrix(x, y, z) = newMatrix(x, y, z);
        end
    end
end







