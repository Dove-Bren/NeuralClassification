function output=HammingMax(centroidMatrix, inputVector)
    hammingVect = hamming(inputVector, centroidMatrix);
    
    maxIndex = maxNet(hammingVect);
    
    output = centroidMatrix(:, maxIndex);
end