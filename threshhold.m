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

%Hey first you use imread('filename') to get the image
%then you use rgb2gray(image)
%finally you run it through this threshold function
%then use imshow to view it