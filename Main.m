function [ test_vector ] = Main( input_args )
%Our Main Function. Yaaay
    %These are the directory paths to our encodings
    BatchOne = '/proj2out/i/';
    BatchTwo = '/proj2out/ii/';
    BatchThree = '/proj2out/iii/';
    %Collect the Weight Matrix returned by the Data Function
    WeightMatrixOne = Data(BatchOne);
    WeightMatrixTwo = Data(BatchTwo);
    WeightMatrixThree = Data(BatchThree);
    %Pass Weight Matrix and Vector to Hamming Function
    %HammingVector = Hamming(WeightMatrixOne, test_vector)
    %Pass Hamming Vector to MaxNet Function
    %ResultIndex = maxNet(HammingVector)
    %Interpret Results
    
end

