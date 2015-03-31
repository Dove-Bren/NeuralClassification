function polarizeDir(direct)
    if (~isdir(direct))
        fprintf('This is not a directory!\n');
        return
    end
    
    olddir = pwd;
    cd(direct);
    
    files = dir('*.jpg');
    for i=1:length(files)
        filename = files(i).name;
        fprintf('%s\n', filename);
        img = polarize(filename);
        [path, name, ext] = fileparts(filename);
        imwrite(img, strcat(name,'_polarized',ext));
    end
    
    
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
  