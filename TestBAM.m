function out = TestBAM( input_args )
    %Construct File Paths
    DogFilePath = 'proj2out/i/dog';
    ElepFilePath = 'proj2out/i/elep';
    GirFilePath = 'proj2out/i/girf';
    BiplaneFilePath = 'proj2out/ii/biplanes';
    JetFilePath = 'proj2out/ii/jetfighters';
    AirbusFilePath = 'proj2out/ii/passengers'
    %Define Class Vectors
    DogClass = [1 -1 -1 1 1 -1];
    BiplaneClass = DogClass
    ElepClass = [1 1 -1 -1 -1 -1];
    JetClass = ElepClass;
    GirClass = [1 1 1 -1 1 1];
    AirbusClass = GirClass;
    
    %Define Centroid Matrices
    DogCentroid = Weight(DogFilePath);
    ElepCentroid = Weight(ElepFilePath);
    GirCentroid = Weight(GirFilePath);
    BiplaneCentroid = Weight(BiplaneFilePath);
    JetCentroid = Weight(JetFilePath);
    AirbusCentroid = Weight(AirbusFilePath);
    
    %Get File names
    DogImages = dir('proj2out/i/dog/*jpg');
    ElepImages = dir('proj2out/i/elep/*jpg');
    GirImages = dir('proj2out/i/girf/*jpg');
    BiplaneImages = dir('proj2out/ii/biplanes/*jpg');
    JetImages = dir('proj2out/ii/jetfighters/*jpg');
    AirbusImages = dir('proj2out/ii/passengers/*jpg');
    %Test Dog Images
    AnimalCentroid = centroidMatrix(DogCentroid, ElepCentroid, GirCentroid);
    AnimalClass = classMatrix(DogClass, ElepClass, GirClass);
    DogCorrect = 0;
    DogIncorrect = 0;
    for i=1:length(DogImages)
       DogFile = getfield(DogImages(i), 'name');
       TestVector = Weight(strcat(DogFilePath,'/',DogFile));
       ResultVector = bam(TestVector, AnimalCentroid, AnimalClass);
       if (isequal(ResultVector, DogClass))
          fprintf('%s was correctly classified!\n', DogFile);
          DogCorrect = DogCorrect + 1;
       else
          fprintf('%s was misclassified!\n', DogFile);
          DogIncorrect = DogIncorrect + 1;
       end
    end
    ElepCorrect = 0;
    ElepIncorrect = 0;
    for i=1:length(ElepImages)
       ElepFile = getfield(ElepImages(i), 'name');
       TestVector = Weight(strcat(ElepFilePath,'/',ElepFile));
       ResultVector = bam(TestVector, AnimalCentroid, AnimalClass);
       if (isequal(ResultVector, ElepClass))
          fprintf('%s was correctly classified!\n', ElepFile);
          ElepCorrect = ElepCorrect + 1;
       else
          fprintf('%s was misclassified!\n', ElepFile);
          ElepIncorrect = ElepIncorrect + 1;
       end
    end
    GirCorrect = 0;
    GirIncorrect = 0;
    for i=1:length(GirImages)
       GirFile = getfield(GirImages(i), 'name');
       TestVector = Weight(strcat(GirFilePath,'/',GirFile));
       ResultVector = bam(TestVector, AnimalCentroid, AnimalClass);
       if (isequal(ResultVector, ElepClass))
          fprintf('%s was correctly classified!\n', GirFile);
          GirCorrect = GirCorrect + 1;
       else
          fprintf('%s was misclassified!\n', GirFile);
          GirIncorrect = GirIncorrect + 1;
       end
    end
    
    PlaneCentroid = centroidMatrix(BiplaneCentroid, JetCentroid, AirbusCentroid);
    PlaneClass = classMatrix(DogClass, ElepClass, GirClass);
    BiplaneCorrect = 0;
    BiplaneIncorrect = 0;
    for i=1:length(BiplaneImages)
       BiplaneFile = getfield(BiplaneImages(i), 'name');
       TestVector = Weight(strcat(BiplaneFilePath,'/',BiplaneFile));
       ResultVector = bam(TestVector, PlaneCentroid, PlaneClass);
       if (isequal(ResultVector, BiplaneClass))
          fprintf('%s was correctly classified!\n', BiplaneFile);
          BiplaneCorrect = BiplaneCorrect + 1;
       else
          fprintf('%s was misclassified!\n', BiplaneFile);
          BiplaneIncorrect = BiplaneIncorrect + 1;
       end
    end
    JetCorrect = 0;
    JetIncorrect = 0;
    for i=1:length(JetImages)
       JetFile = getfield(JetImages(i), 'name');
       TestVector = Weight(strcat(JetFilePath,'/',JetFile));
       ResultVector = bam(TestVector, PlaneCentroid, PlaneClass);
       if (isequal(ResultVector, JetClass))
          fprintf('%s was correctly classified!\n', JetFile);
          JetCorrect = JetCorrect + 1;
       else
          fprintf('%s was misclassified!\n', JetFile);
          JetIncorrect = JetIncorrect + 1;
       end
    end
    AirbusCorrect = 0;
    AirbusIncorrect = 0;
    for i=1:length(AirbusImages)
       AirbusFile = getfield(AirbusImages(i), 'name');
       TestVector = Weight(strcat(AirbusFilePath,'/',AirbusFile));
       ResultVector = bam(TestVector, PlaneCentroid, PlaneClass);
       if (isequal(ResultVector, AirbusClass))
          fprintf('%s was correctly classified!\n', AirbusFile);
          AirbusCorrect = AirbusCorrect + 1;
       else
          fprintf('%s was misclassified!\n', JetFile);
          AirbusIncorrect = AirbusIncorrect + 1;
       end
    end
    
    fprintf('ANIMAL RESULTS:\n');
    fprintf('\tDog results: \n');
    fprintf('\t\t%d Correctly Classified\n', DogCorrect);
    fprintf('\t\t%d Incorrectly Classified\n', DogIncorrect);
    fprintf('\tElephant results: \n');
    fprintf('\t\t%d Correctly Classified\n', ElepCorrect);
    fprintf('\t\t%d Incorrectly Classified\n', ElepIncorrect);
    fprintf('\tGiraffe results: \n');
    fprintf('\t\t%d Correctly Classified\n', GirCorrect);
    fprintf('\t\t%d Incorrectly Classified\n', GirIncorrect);
    fprintf('PLANE RESULTS:\n');
    fprintf('\tBiplane Results:\n');
    fprintf('\t\t%d Correctly Classified\n', BiplaneCorrect);
    fprintf('\t\t%d Incorrectly Classified\n', BiplaneIncorrect);
    fprintf('\tJet Results:\n');
    fprintf('\t\t%d Correctly Classified\n', JetCorrect);
    fprintf('\t\t%d Incorrectly Classified\n', JetIncorrect);
    fprintf('\tAirbus Results:\n');
    fprintf('\t\t%d Correctly Classified\n', AirbusCorrect);
    fprintf('\t\t%d Incorrectly Classified\n', AirbusIncorrect);
    out = 0;
end

