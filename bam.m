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
