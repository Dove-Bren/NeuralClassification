function output=hamming(InputVector, WeightMatrix)
i=0;
[w,h] = size(WeightMatrix)
output= zeros(1,w)
for i= 1:w
b=InputVector;
a=WeightMatrix(i,:);
hammingDist = @(a,b)sum( a(:)~= b(:));
output(i)= hammingDist(a,b);
end
