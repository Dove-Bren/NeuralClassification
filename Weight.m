function output=Weight(input)

    if (~isdir(input))
        %assume its a single file name
        fprintf('Processing file: %s\n', str(input));
        img = polarize(input);
        output = img;
        return;
    else
        olddir = pwd;
        cd(input);
    
        files = dir('*.jpg');
        
        %init empty matrix
        output = zeros(48, 64);
        for i=1:length(files)
            filename = files(i).name;
            fprintf('Processing file: %s\n', filename);
            
            %polarize the image
            img = polarize(filename);
            %img matrix is added to output matrix
            output= output + img;
            i=i+1;
        end
    end
    
    %all img matrices should be added, now averaged
   output= output/i;
   output=output*148;  %skews values for proper threshhold
   output= threshhold(output); %threshhold the avg
   %output= (2*output) - 1;
   
   cd(olddir); 
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
    img=imresize(imgIn, [48, 64]);
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
