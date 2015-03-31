function output=vectorization(InputMatrix)
    i = 0;
    [w,h] = size(InputMatrix);
    
    %init Matrix for super fast speeds omg
    output = zeros(w,h);
    
    %iterate through all files in the passed matrix
    while (i < h)
        file = InputMatrix(i + 1, 1);
        %polarize each image
        fprintf('%s | ', file);
        img = polarize(file);
        
        %get image as a 1 x n vector
        vect = img(:);
        
        %transpose so it's a column vector
        vect = vect';
        
        %set the i'th COL to be the same as our vector
        output(:,i) = vect;
        i = i + 1;
    end
end