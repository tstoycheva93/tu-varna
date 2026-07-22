% Зареждаме набора данни на Фишер
load fisheriris

% Признаци (всички 4 колони)
X = meas;

% Двоични етикети: 1 ако е 'versicolor', иначе 0
% (nominal е премахнат – не ти трябва; ползвай logical или categorical)
Y = ismember(species,'versicolor');   % логически вектор

% Разделяме на train/test с Holdout = 25%
P = cvpartition(Y,'Holdout',0.25);

Xtr = X(training(P),:);
Ytr = Y(training(P));
Xte = X(test(P),:);
Yte = Y(test(P));

% Обучаваме SVM с RBF ядро (замества svmtrain)
Mdl = fitcsvm(Xtr, Ytr, ...
    'KernelFunction','rbf', ...
    'Standardize',true);   % мащабиране подобрява резултати

% Класификация на тестовите данни (замества svmclassify)
C = predict(Mdl, Xte);

% Метрики
errRate  = 100*mean(Yte ~= C)
Accuracy = 100*mean(Yte == C)

% Матрица на объркванията
conMat = confusionmat(Yte, C)         % по редове: истински, по колони: предсказани
