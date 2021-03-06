%IMPORTANT%
%BAM requires bipolar vector inputs. So the input_vector and
%centrod_matrix MUST be in a bipolar form or this implmentation will not
%work!
function output_vector = bam( input_vector, centroid_matrix, class_matrix)
    %This is the X layer of neurons
    WeightMatrix = bam_weight(class_matrix, centroid_matrix);
    %The Y Layer association:
    
    %fprintf('Finding Y classification Vector\n');
    %fprintf('Input Vector Length = %d\n', length(input_vector));
    %fprintf('Weight: C = %d, R = %d\n', wCol, wRow);
    Y_classification = input_vector' * WeightMatrix;
    Y_length = length(Y_classification);
    output_vector = [Y_length];
    for i=1:Y_length
       %fprintf('%d, ', Y_classification(i));
       if (Y_classification(i) > 0)
          output_vector(i) = 1;
       elseif (Y_classification(i) < 0)
           output_vector(i) = -1;
       else
           output_vector(i) = 0;
       end
    end
end

%Returns the X association vector. This is done by multiplying Y or our
%classification Vector by our Weight Matrix. In otherwords, we enter
%"Giraffe" and this Matrix will return what it thinks a Giraffe is.
%bamT(input_vector, centroid_matrix, class_matrix)
%class_vector - This is the classification vector.
%centroid_matrix - This is the cntroid matrix containing all of the defined
%               crentoids. Each individual centroid must be aligned
%               verticaly in order for this function to return properly.
%class_matrix - This matrix stores all of our classificiations (e.g. what
%               the input is to be associated with). These classifications
%               MUST be aligned horizontally!
function output_vector = bamT( class_vector, centroid_matrix, class_matrix)
    %This is the Y layer of neurons
    WeightMatrix = bam_weight_T(class_matrix, centroid_matrix);
    %X_association is what BAM associates with a classification.
    X_association = class_vector * WeightMatrix;
    output_vector = X_association;
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
    [classCol, classRow, d] = size(class_matrix);
    [columns, rows, d] = size(centroid_matrix);
    WeightMatrix = zeros(columns, classRow);
    [weightColumns, weightRows, d] = size(WeightMatrix);
    %Find weights per matrix and find sum
    %fprintf('Contructing Weight Matrix...\n');
    %fprintf('Weight: C = %d, R = %d\n', weightColumns, weightRows);
    for col=1:classCol
        tmpMatrix = centroid_matrix(:,col) * class_matrix(col,:);
        [tmpColumns, tmpRows] = size(tmpMatrix);
        %fprintf('Tmp: C = %d, R = %d\n', tmpColumns, tmpRows);
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
       tmpMatrix = centroid_matrix(:,col) * class_matrix(col,:);
       WeightMatrix = WeightMatrix + tmpMatrix;
    end
    %Return the created Weight Matrix
    output_matrix = WeightMatrix;
end
