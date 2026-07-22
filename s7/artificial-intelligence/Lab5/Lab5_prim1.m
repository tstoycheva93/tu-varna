load carsmall
x1 = Weight;
y = MPG;

X = [ones(size(x1)) x1];
b = regress(y,X);
x1fit = min(x1):10:max(x1);
[X1FIT] = meshgrid(x1fit);
% YFIT = b(1) + b(2)*X1FIT;
YFIT = b(1) + b(2)*x1fit;
scatter(x1,y,'filled'); hold on ; plot(x1fit,YFIT)
xlabel('Weight')
ylabel('MPG')

I2=find(isnan(y)==0);
Ycl=y(I2);
Xcl=x1(I2);
Yf=b(1)+b(2)*Xcl;
D=sum((Ycl-Yf).^2)