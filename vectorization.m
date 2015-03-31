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

function output=polarize(img)
    if (ischar(img))
       img = getImage(img);
    end
    
    img = resizeImage(img);
    
    output = rgb2gray(img);
    output = threshhold(output);
end

function img=getImage(filename)
    img = imread(filename);
end

function img=resizeImage(imgIn)
    img=imresize(imgIn, [480, 640]);
end

function output=threshhold(InputMatrix)
    [w,h,d] = size(InputMatrix);
    for i=1:w
    for j=1:h
       if (InputMatrix(i,j) < 128)
          output(i,j) = 0;
       else
           output(i,j) = 1;
       end
    end
    end
end