%Contructs a Weight Matrix based upon an input vector and a given weight
%matrix.
%bam(input_vector, centroid_matrix)
%input_vector - This is the input vector (what is being tested) this is
%               required to be horizonally aligned in order for 
%               this function to return a matrix. Otherwise this 
%               WILL RETURN A SCALAR!
%centroid_matrix - This is the centroid matrix containing all of the
%               defined centroids. Each individual centroid must be aligned
%               vertically in order for this function to return a matrix.
%This function uses the Bidirectional Associated Memory algorithm.
%Specificially, this function returns the constructed weight matrix.
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

%Contructs a TRANSPOSED Weight Matrix based upon an input vector and a 
%given weight matrix.
%bam(input_vector, centroid_matrix)
%input_vector - This is the input vector (what is being tested) this is
%               required to be horizonally aligned in order for 
%               this function to return a matrix. Otherwise this 
%               WILL RETURN A SCALAR!
%centroid_matrix - This is the centroid matrix containing all of the
%               defined centroids. Each individual centroid must be aligned
%               vertically in order for this function to return a matrix.
%This function uses the Bidirectional Associated Memory algorithm.
%Specificially, this function returns the constructed weight matrix.
function output_matrix = bam_transposed( input_vector, centroid_matrix)
    WeightMatrix;
    centroid_matrix = centroid_matrix';
    [columns, rows] = size(centroid_matrix);
    %Find weights per matrix and find sum
    for col=1:columns
       tmpMatrix = centroidMatrix(:,col) * input_vector;
       WeightMatrix = WeightMatrix + tmpMatrix;
    end
    %Return the created Weight Matrix
    output_matrix = WeightMatrix;
end