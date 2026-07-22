
load diabetes

Y = nominal(T_train'); 

CDTStruct=fitctree(P_train',Y);
view(CDTStruct,'mode','graph')


C = predict(CDTStruct,P_test');

Accuracy = 100* sum(nominal(T_test')== C)/length(T_test)  

conMat = confusionmat(nominal(T_test'),C)

