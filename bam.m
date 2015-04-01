%This Function operates correctly when the input_vector is horizontal
%and the centroid_matrix is arranged vertically.
function output_matrix = bam( input_vector, centroid_matrix )
    %This function applies a Bidirectional Associative Memory
    %Algorithm
    WeightMatrix;
    [columns, rows] = size(bam);
    %Find weights per matrix and find sum
    for col=1:columns
        tmpMatrix = col * input_vector;
        WeightMatrix += tmpMatrix;
    end
    
    output_matrix = WeightMatrix;