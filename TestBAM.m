function out = TestBAM( input_args )
    %Construct File Paths
    DogFilePath = 'proj2out/i/dog';
    ElepFilePath = 'proj2out/i/elep';
    GirFilePath = 'proj2out/i/girf';
    
    BiplaneFilePath = 'proj2out/ii/biplanes';
    JetFilePath = 'proj2out/ii/jetfighters';
    AirbusFilePath = 'proj2out/ii/passengers';
    
    ShipFilePath = 'proj2out/iii/ships';
    SubFilePath = 'proj2out/iii/subs';
    WhaleFilePath = 'proj2out/iii/whales';
    %Define Class Vectors
    DogClass = [1 -1 -1 1 1 -1];
    BiplaneClass = DogClass'
    ShipClass = DogClass;
    ElepClass = [1 1 -1 -1 -1 -1];
    JetClass = ElepClass;
    SubClass = ElepClass;
    GirClass = [1 1 1 -1 1 1];
    AirbusClass = GirClass;
    WhaleClass = GirClass;
    
    %Define Centroid Matrices
    DogCentroid = Weight(DogFilePath);
    ElepCentroid = Weight(ElepFilePath);
    GirCentroid = Weight(GirFilePath);
    
    BiplaneCentroid = Weight(BiplaneFilePath);
    JetCentroid = Weight(JetFilePath);
    AirbusCentroid = Weight(AirbusFilePath);
    
    ShipCentroid = Weight(ShipFilePath);
    SubCentroid = Weight(SubFilePath);
    WhaleCentroid = Weight(WhaleFilePath);
    
    %Get File names
    DogImages = dir('proj2out/i/dog/*jpg');
    ElepImages = dir('proj2out/i/elep/*jpg');
    GirImages = dir('proj2out/i/girf/*jpg');
    
    BiplaneImages = dir('proj2out/ii/biplanes/*jpg');
    JetImages = dir('proj2out/ii/jetfighters/*jpg');
    AirbusImages = dir('proj2out/ii/passengers/*jpg');
    
    ShipImages = dir('proj2out/iii/ships/*jpg');
    SubImages = dir('proj2out/iii/subs/*jpg');
    WhaleImages = dir('proj2out/iii/whales/*jpg');
    
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
    %Test Elephant Images
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
    %Test Giraffe Images
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
    
    %Test Biplane Images
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
    %Test Jet Images
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
    %Test Airbus Images
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
          fprintf('%s was misclassified!\n', AirbusFile);
          AirbusIncorrect = AirbusIncorrect + 1;
       end
    end
    
    MarineCentroid = centroidMatrix(ShipCentroid, SubCentroid, WhaleCentroid);
    MarineClass = classMatrix(ShipClass, SubClass, WhaleClass);
    ShipCorrect = 0;
    ShipIncorrect = 0;
    for i=1:length(ShipImages)
       ShipFile = getfield(ShipImages(i), 'name');
       TestVector = Weight(strcat(ShipFilePath,'/',ShipFile));
       ResultVector = bam(TestVector, MarineCentroid, MarineClass);
       if (isequal(ResultVector, ShipClass))
          fprintf('%s was correctly classified!\n', ShipFile);
          ShipCorrect = ShipCorrect + 1;
       else
          fprintf('%s was misclassified!\n', ShipFile);
          ShipIncorrect = ShipIncorrect + 1;
       end
    end
    SubCorrect = 0;
    SubIncorrect = 0;
    for i=1:length(SubImages)
       SubFile = getfield(SubImages(i), 'name');
       TestVector = Weight(strcat(SubFilePath,'/',SubFile));
       ResultVector = bam(TestVector, MarineCentroid, MarineClass);
       if (isequal(ResultVector, SubClass))
          fprintf('%s was correctly classified!\n', SubFile);
          SubCorrect = SubCorrect + 1;
       else
          fprintf('%s was misclassified!\n', SubFile);
          SubIncorrect = SubIncorrect + 1;
       end
    end
    
    WhaleCorrect = 0;
    WhaleIncorrect = 0;
    for i=1:length(WhaleImages)
       WhaleFile = getfield(WhaleImages(i), 'name');
       TestVector = Weight(strcat(WhaleFilePath,'/',WhaleFile));
       ResultVector = bam(TestVector, MarineCentroid, MarineClass);
       if (isequal(ResultVector, WhaleClass))
          fprintf('%s was correctly classified!\n', WhaleFile);
          WhaleCorrect = WhaleCorrect + 1;
       else
          fprintf('%s was misclassified!\n', WhaleFile);
          WhaleIncorrect = WhaleIncorrect + 1;
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
    fprintf('MARINE RESULTS\n');
    fprintf('\tShip Results:\n');
    fprintf('\t\t%d Correctly Classified\n', ShipCorrect);
    fprintf('\t\t%d Incorrectly Classified\n', ShipIncorrect);
    fprintf('\tSubmarine Results:\n');
    fprintf('\t\t%d Correctly Classified\n', SubCorrect);
    fprintf('\t\t%d Incorrectly Classified\n', SubIncorrect);
    fprintf('\tWhale Results:\n');
    fprintf('\t\t%d Correctly Classified\n', WhaleCorrect);
    fprintf('\t\t%d Incorrectly Classified\n', WhaleIncorrect);
    out = 0;
end

