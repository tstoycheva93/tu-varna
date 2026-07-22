% зареждаме набора данни на Фишер 
load fisheriris

X = [meas(:,1) meas(:,2) meas(:,3) meas(:,4)]; 

% X = [meas(:,1) meas(:,2)]; 

Y = nominal(ismember(species,'versicolor')); 


P = cvpartition(Y,'Holdout',0.25);

% Създаваме класификатор “linear support vector machine” използвайки % обучаващите данни и съответните етикети за класова принадлежност 
svmStruct=svmtrain(X(P.training,:),Y(P.training),'showplot',true,'kernel_function','rbf','method','SMO');

% Използваме класификатора за да обработим тестовия набор от данни
C = svmclassify(svmStruct,X(P.test,:),'showplot',true);

% Изчисляваме грешката от класификация като броя на грешните решения 
% към общия брой тестови вектори (miss-classification rate)
errRate = 100*sum(Y(P.test)~= C)/P.TestSize
Accuracy = 100*sum(Y(P.test)== C)/P.TestSize

Y2 = nominal(ismember(species,'virginica')); 


P2 = cvpartition(Y2,'Holdout',0.25);

% Създаваме класификатор “linear support vector machine” използвайки % обучаващите данни и съответните етикети за класова принадлежност 
svmStruct=svmtrain(X(P2.training,:),Y2(P2.training),'showplot',true,'kernel_function','rbf','method','SMO');

% Използваме класификатора за да обработим тестовия набор от данни
C2 = svmclassify(svmStruct,X(P2.test,:),'showplot',true);

% Изчисляваме грешката от класификация като броя на грешните решения 
% към общия брой тестови вектори (miss-classification rate)
errRate2 = 100*sum(Y2(P2.test)~= C2)/P2.TestSize
Accuracy2 = 100*sum(Y2(P2.test)== C2)/P2.TestSize

Y3 = nominal(ismember(species,'setosa')); 


P3 = cvpartition(Y3,'Holdout',0.25);

% Създаваме класификатор “linear support vector machine” използвайки % обучаващите данни и съответните етикети за класова принадлежност 
svmStruct=svmtrain(X(P3.training,:),Y3(P3.training),'showplot',true,'kernel_function','rbf','method','SMO');

% Използваме класификатора за да обработим тестовия набор от данни
C3 = svmclassify(svmStruct,X(P3.test,:),'showplot',true);

% Изчисляваме грешката от класификация като броя на грешните решения 
% към общия брой тестови вектори (miss-classification rate)
errRate3 = 100*sum(Y3(P3.test)~= C3)/P3.TestSize
Accuracy3 = 100*sum(Y3(P3.test)== C3)/P3.TestSize
% Изчисляваме матрицата на решенията на класификатора 
% (confusion matrix)
%  conMat = confusionmat(Y(P.test),C); 
% conMat
  Total_Accuracy=mean([Accuracy Accuracy2 Accuracy3]) 
