
clear all
load fisheriris
% X = [meas(:,1), meas(:,2), meas(:,3), meas(:,4)]; % {1,2,3,4}
X = [meas(:,1), meas(:,2)];
% X = [meas(:,4)]

Y = ismember(species,'versicolor'); %{versicolor, virginica, setosa}
P = cvpartition(Y,'Holdout',0.25);
Nin=size(X,2);
Ncomp1=1;
Ncomp2=1;
mix1=gmm(Nin,Ncomp1,'spherical');
mix2=gmm(Nin,Ncomp2,'spherical');
options = foptions;
options(1) = 1;
options(3) = 0;
options(5) = 1;
options(14) = 100;
mix1 = gmmem(mix1,X(P.training & Y==0,:),options);
mix2 = gmmem(mix2,X(P.training & Y==1,:),options); 
C1 = gmmactiv(mix1,X(P.test,:));
C2 = gmmactiv(mix2,X(P.test,:));
C1s = max(C1,[],2);
C2s = max(C2,[],2);
[vc, ic]=max([C1s,C2s],[],2);
Clog=boolean(ic-1);
Accuracy = 100*sum(Y(P.test) == Clog)/P.TestSize  %mis-classification rate
conMat = confusionmat(Y(P.test),Clog) % the confusion matrix

