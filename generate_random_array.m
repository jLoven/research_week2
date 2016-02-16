function originalMatrix = generate_random_array(originalMatrix, tuner, maxSeeds, seedPercentage)
    maxVectorNumber = numel(originalMatrix);
    %  TODO: This is random for now, but should be tunable:
    %  Tuner goes from 1 to 10. 10 will be fewer random replacements and more correlated. 1 will be more random replacements and less correlated.
    %  Can change this percentage of replacements later:
    replacementFraction = 1 - (tuner/11);
    numberOfReplacements = randi(round(maxVectorNumber * replacementFraction));
    %  TODO: Correlation factor
    %  Choose number of seeds less than or equal to maxSeeds (ex: 7), take seedPercentage% of the possible replacements for each seed, and do the rest random.
    numberOfSeeds = round((1-replacementFraction) * maxSeeds);
    %  CONTINUE HERE with correlation and separating replacements between seeds and nonseeds:
    correlatedReplacements = (numberOfSeeds / seedPercentage)
    replacementVectorMatrix = randi(numberOfReplacements, 3);
    for rows = 1:size(replacementVectorMatrix(1);
        x = replacementVectorMatrix(rows, 1);
        y = replacementVectorMatrix(rows, 2);
        z = replacementVectorMatrix(rows, 3);
        if (originalMatrix(x, y, z) != newMatrix(x, y, z)) 
            originalMatrix(x, y, z) = newMatrix(x, y, z);
        end
    end
end
