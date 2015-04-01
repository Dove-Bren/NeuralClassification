<<<<<<< HEAD
%This Function operates correctly when the input_vector is horizontal
%and the centroid_vector is vertical in structure.
function output_vector = bam( input_vector, centroid_vector )
%This function applies a Bidirectional Associative Memory
%Algorithm against 2 input vectors

%Determined transposed weight
centroid_trans = centroid_vector';
%Find the Y neuron layer output
Y_layer_output = centroid_vector * input_vector;
%Put the Y output back into a transposed weight vector
%This is to get back out stored output
output_vector = Y_layer_output * centroid_trans;
end

=======
%Expects a matrix with each COLUMN being a centroid
function output=ham(inputmatrix)
    [h,w] = size(inputmatrix);
    output = zeros(h, h);
    
    for i=1:w
       output = output + getWeight(inputmatrix(:, i))
    end
    
    %go through and zero out the diagonal
    for i=1:h
       output(i,i) = 0;
    end
    
    
end

function weightMatrix = getWeight(inputVector)
   transVect = inputVector';
   weightMatrix = inputVector * transVect;
end
>>>>>>> 5521a29ee70c1716ccf612249448b80680131cf0
