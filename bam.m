%IMPORTANT%
%BAM requires bipolar vector inputs. So the input_vector and
%centrod_matrix MUST be in a bipolar form or this implmentation will not
%work!
function output_vector = bam( input_vector, centroid_matrix, class_matrix)
    %This is the X layer of neurons
    WeightMatrix = bam_weight(class_matrix, centroid_matrix);
    %The Y Layer association:
    Y_classification = input_vector * WeightMatrix;
    output_vector = Y_classification;
end

%Returns the X association vector. This is done by multiplying Y or our
%classification Vector by our Weight Matrix. In otherwords, we enter
%"Giraffe" and this Matrix will return what it thinks a Giraffe is.
%bamT(input_vector, centroid_matrix, class_matrix)
%input_vector - This is the classification vector.
%centroid_matrix - This is the cntroid matrix containing all of the defined
%               crentoids. Each individual centroid must be aligned
%               verticaly in order for this function to return properly.
%class_matrix - This matrix stores all of our classificiations (e.g. what
%               the input is to be associated with). These classifications
%               MUST be aligned horizontally!
function output_vector = bamT( input_vector, centroid_matrix, class_matrix)
    %This is the Y layer of neurons
    WeightMatrix = bam_weight_T(class_matrix, centroid_matrix);
    %X_association is what BAM associates with a classification.
    X_association = input_vector * WeightMatrix;
    output_vector = X_association.
end

%Contructs a Weight Matrix based upon an input vector and a given weight
%matrix.
%bam_weight(input_vector, centroid_matrix)
%class_matrix - This matrix stores all of our classifications (e.g. what
%               the input is to be associated with). These classificiations
%               MUST be aligned horizontally!
%centroid_matrix - This is the centroid matrix containing all of the
%               defined centroids. Each individual centroid must be aligned
%               vertically in order for this function to return properly.
%This function uses the Bidirectional Associated Memory algorithm.
%Specificially, this function returns the constructed weight matrix.
function output_matrix = bam_weight( class_matrix, centroid_matrix )
    %This function applies a Bidirectional Associative Memory
    %Algorithm
    WeightMatrix;
    [columns, rows] = size(centroid_matrix);
    %Find weights per matrix and find sum
    for col=1:columns
        tmpMatrix = centroidMatrix(:,col) * class_matrix(col,:);
        WeightMatrix = WeightMatrix + tmpMatrix;
    end
    %Return the created Weight Matrix
    output_matrix = WeightMatrix;
end

%Contructs a TRANSPOSED Weight Matrix based upon an input vector and a 
%given weight matrix.
%bam_weight_T(input_vector, centroid_matrix)
%class_matrix - This matrix stores all of our classifications (e.g what the
%               input is to be associated with). These classifications MUST
%               be aligned horizontally!
%centroid_matrix - This is the centroid matrix containing all of the
%               defined centroids. Each individual centroid must be aligned
%               vertically in order for this function to return a properly.
%This function uses the Bidirectional Associated Memory algorithm.
%Specificially, this function returns the constructed weight matrix.
function output_matrix = bam_weight_T( input_vector, class_matrix)
    WeightMatrix;
    centroid_matrix = centroid_matrix';
    [columns, rows] = size(centroid_matrix);
    %Find weights per matrix and find sum
    for col=1:columns
       tmpMatrix = centroidMatrix(:,col) * class_matrix(col,:);
       WeightMatrix = WeightMatrix + tmpMatrix;
    end
    %Return the created Weight Matrix
    output_matrix = WeightMatrix;
end