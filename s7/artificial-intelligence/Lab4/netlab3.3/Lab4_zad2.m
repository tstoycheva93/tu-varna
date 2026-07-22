load fisheriris
X = [meas(:,1), meas(:,2) meas(:,3), meas(:,4)];
%X = [meas(:,1), meas(:,2), meas(:,3), meas(:,4)]; % {1,2,3,4}
% Extract the Setosa class
%Y = nominal(ismember(species,'setosa')); %{versicolor, virginica, setosa}
% Randomly partitions observations into a training set and a test
% set using stratified holdout
P = cvpartition(species,'Holdout',0.1);
% Use a linear support vector machine classifier
mix=gmm(4,3,'spherical');
options = foptions;
options(14) = 25;
mix = gmmem(mix,X(P.training,:),options);
C = gmmpost(mix,X(P.test,:))
lab=species(P.test)
len=length(lab);
for r=1:len,
fprintf(1,'%f %f %f\t %s\n',C(r,1),C(r,2),C(r,3),lab{r});
end
%errRate = sum(Y(P.test)~= C)/P.TestSize  %mis-classification rate
%conMat = confusionmat(Y(P.test),C) % the confusion matrix