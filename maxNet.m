function index = maxNet( input_vector )
%MAXNET Summary of this function goes here
%   Determine Epsilon (E)
    E = min(input_vector);
    %Find size of vector
    size = length(input_vector);
    %Decrement all input vectors by Epsilon
    for i=1:size
       input_vector(i) = input_vector(i) - E; 
    end
    %Check for first zero
    for i=1:size
        if (input_vector(i) == 0)
           %Return index of vector that reaches 0 first
           index = i;
           return;
        end
    end
    %Continue until we find a zero
    index = maxNet(input_vector);
    return;
end
