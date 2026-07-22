 
clear all
load carsmall

ind=find(isnan(Weight) + isnan(Horsepower) + isnan(Displacement) + isnan(MPG)==0);
X1=Weight(ind);
X2=Cylinders(ind);
X3=Acceleration(ind);               
y=MPG(ind);
Xm=[ones(size(X1)) X1,X2, X3];
m1=fitlm(Xm(:,2:end),MPG(1:93));
Xtest=[4000 ,4 ,8];
yf=predict(m1,Xtest);
yf
Yf = 235.21/yf  %*0.42(km/l)  %235.21/yf(l/100km)
Ytrue=20 %MPG
D=sum(yf-Ytrue)
