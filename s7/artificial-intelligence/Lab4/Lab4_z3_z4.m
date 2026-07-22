 clear all
load diabetes
% Mx=max(P_train,[],2); 
% P_train_norm = (P_train ./ (Mx*ones(1,size(P_train,2))))';
% P_test_norm = (P_test ./ (Mx*ones(1,size(P_test,2))))';
P_train_norm = P_train';
P_test_norm = P_test';
Y = ismember(T_train,2); 
Nin=size(P_train,1);
Ncomp1=1;
Ncomp2=2;
mix1=gmm(Nin,Ncomp1,'spherical');
mix2=gmm(Nin,Ncomp2,'spherical');
options = foptions;
options(1) = 0;
options(3) = 0;
options(5) = 1;
options(14) = 100;
mix1=gmminit(mix1,P_train_norm(Y==0,:),options);
mix2=gmminit(mix2,P_train_norm(Y==1,:),options);
options(3) = 0;
options(5) = 1;
options(14) = 100;
mix1 = gmmem(mix1,P_train_norm(Y==0,:),options);
mix2 = gmmem(mix2,P_train_norm(Y==1,:),options);

C1 = gmmactiv(mix1,P_test_norm);
C2 = gmmactiv(mix2,P_test_norm);
Cs1=max(C1,[],2);
Cs2=max(C2,[],2);

[vp,Clog]=max([Cs1 Cs2],[],2);

Accuracy = 100*sum(T_test' == Clog)/length(T_test)  %mis-classification rate
conMat = confusionmat(T_test',Clog) % the confusion matrix