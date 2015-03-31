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