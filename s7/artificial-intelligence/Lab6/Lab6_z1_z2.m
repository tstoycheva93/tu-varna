% зареждаме набора данни на Фишер 
load fisheriris

% дефинираме X да ползва два от четирите описатела   
% X = [meas(:,1) meas(:,2) meas(:,3) meas(:,4)]; 
X = [meas(:,1) meas(:,2)];  
% X = [meas(:,4)];

% Избираме един от класовете „versicolor” за да създадем детектор 
% за него {versicolor, virginica, setosa}
Y = nominal(ismember(species,'versicolor'));   %if not working use categorical instead of nominal!


% По случаен начин разделяме оригиналният набор данни на 
% обучаващ набор и тестов набор използвайки метода „stratified holdout”
P = cvpartition(Y,'Holdout',0.25);

% Създаваме класификатор “дърво на решенията за класификация” използвайки 
% обучаващите данни и съответните етикети за класова принадлежност 
CDTStruct=fitctree(X(P.training,:),Y(P.training));
view(CDTStruct,'mode','graph')

% Използваме класификатора за да обработим тестовия набор от данни
C = predict(CDTStruct,X(P.test,:));

% Изчисляваме грешката от класификация като броя на грешните решения 
% към общия брой тестови вектори (miss-classification rate)
errRate = 100*sum(Y(P.test)~= C)/P.TestSize
Accuracy = 100*sum(Y(P.test)== C)/P.TestSize

% Изчисляваме матрицата на решенията на класификатора 
% (confusion matrix)
conMat = confusionmat(Y(P.test),C); 
conMat
  
