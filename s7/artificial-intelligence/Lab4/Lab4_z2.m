
clear all
load fisheriris
X = [meas(:,1), meas(:,2), meas(:,3), meas(:,4)]; % {1,2,3,4}
Y = ismember(species,'versicolor'); %{versicolor, virginica, setosa}
Y2 = ismember(species,'virginica'); %{versicolor, virginica, setosa}
Y3 = ismember(species,'setosa'); %{versicolor, virginica, setosa}
P = cvpartition(Y,'Holdout',0.25);
P2 = cvpartition(Y,'Holdout',0.25);
P3 = cvpartition(Y,'Holdout',0.25);
Nin=size(X,2);
Ncomp1=1;
Ncomp2=1;
mix1=gmm(Nin,Ncomp1,'spherical');
mix2=gmm(Nin,Ncomp2,'spherical');
mix11=gmm(Nin,Ncomp1,'spherical');
mix22=gmm(Nin,Ncomp2,'spherical');
mix111=gmm(Nin,Ncomp1,'spherical');
mix222=gmm(Nin,Ncomp2,'spherical');
options = foptions;
options(1) = 1;
options(3) = 0;
options(5) = 1;
options(14) = 100;
mix1 = gmmem(mix1,X(P.training & Y==0,:),options);
mix2 = gmmem(mix2,X(P.training & Y==1,:),options); 
mix11 = gmmem(mix11,X(P2.training & Y2==0,:),options);
mix22 = gmmem(mix22,X(P2.training & Y2==1,:),options); 
mix111 = gmmem(mix111,X(P3.training & Y3==0,:),options);
mix222 = gmmem(mix222,X(P3.training & Y3==1,:),options); 
C1 = gmmactiv(mix1,X(P.test,:));
C2 = gmmactiv(mix2,X(P.test,:));
C11 = gmmactiv(mix11,X(P.test,:));
C22 = gmmactiv(mix22,X(P.test,:));
C111 = gmmactiv(mix111,X(P.test,:));
C222 = gmmactiv(mix222,X(P.test,:));
C1s = max(C1,[],2);
C2s = max(C2,[],2);
C11s = max(C11,[],2);
C22s = max(C22,[],2);
C111s = max(C111,[],2);
C222s = max(C222,[],2);
[vc, ic]=max([C1s,C2s],[],2);
[vc2, ic2]=max([C11s,C22s],[],2);
[vc3, ic3]=max([C111s,C222s],[],2);
Clog=boolean(ic-1);
Clog2=boolean(ic2-1);
Clog3=boolean(ic3-1);
Accuracy1 = 100*sum(Y(P.test) == Clog)/P.TestSize;  %mis-classification rate
Accuracy2 = 100*sum(Y(P.test) == Clog2)/P.TestSize;  %mis-classification rate
Accuracy3= 100*sum(Y(P.test) == Clog3)/P.TestSize;  %mis-classification rate
Accuracy=(Accuracy1+Accuracy2+Accuracy3)/3
% conMat = confusionmat(Y(P.test),Clog) % the confusion matrix

