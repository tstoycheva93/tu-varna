load fisheriris
X = [meas(:,3), meas(:,4)];
%X = [meas(:,1), meas(:,2), meas(:,3), meas(:,4)]; % {1,2,3,4}
% Extract the Setosa class
Y = nominal(ismember(species,'setosa')); %{versicolor, virginica, setosa}
% Randomly partitions observations into a training set and a test
% set using stratified holdout
P = cvpartition(Y,'Holdout',0.1);
% Use a linear support vector machine classifier
mix=gmm(2,2,'diag');
options = foptions;
options(14) = 25;
mix = gmmem(mix,X(P.training,:),options);
C = gmmpost(mix,X(P.test,:))
species(P.test)
%errRate = sum(Y(P.test)~= C)/P.TestSize  %mis-classification rate
%conMat = confusionmat(Y(P.test),C) % the confusion matrix