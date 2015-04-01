%This Function operates correctly when the input_vector is horizontal
%and the centroid_matrix is arranged vertically.
function output_matrix = bam( input_vector, centroid_matrix )
    %This function applies a Bidirectional Associative Memory
    %Algorithm
    WeightMatrix;
    [columns, rows] = size(centroid_matrix);
    %Find weights per matrix and find sum
    for col=1:columns
        tmpMatrix = centroidMatrix(:,col) * input_vector;
        WeightMatrix = WeightMatrix + tmpMatrix;
    end
    %Return the created Weight Matrix
    output_matrix = WeightMatrix;
end

%This function operates correctly when the input_vector is horizontal
%and the centroid_matrix is arranged vertically
function output_matrix = bam( input_vector, centroid_matrix)
    WeightMatrix;
    []
end