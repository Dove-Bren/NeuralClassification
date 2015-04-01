%Expects a matrix with each COLUMN being a centroid
function output=bam(inputmatrix)
    [w,h] = size(inputmatrix(:, 1));
    output = zeros(h, h);
    
    for i=1:w
       output = output + getWeight(inputmatrix(:, i));
    end
    
    
end

function weightMatrix = getWeight(inputVector)
   transVect = inputVector';
   weightMatrix = transVect * inputVector;
end