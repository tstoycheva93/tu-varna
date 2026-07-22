clear all
close all
% зареждаме базата данни
load carsmall
% избираме теглото на автомобила „Weight“ за независима променлива
% посредством която да предскажем MPG и визуализираме

indx=find(isnan(MPG) + isnan(Weight) + isnan(Horsepower)...
    +isnan(Acceleration) + isnan(Displacement) + isnan(Cylinders) ==0);

x1 = Weight(indx);
x2 = Acceleration(indx);
y = MPG(indx);
step1=(max(x1)-min(x1))/10;
step2=(max(x2)-min(x2))/10;
scatter3(x1,x2,y,'filled');
hold on
X = [ones(size(x1)) x1 x2];
b = regress(y,X); % Removes NaN data
x1fit = min(x1):step1:max(x1);
x2fit = min(x2):step2:max(x2);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT;
mesh(X1FIT,X2FIT,YFIT)
xlabel('Weight')
ylabel('Acceleration')
zlabel('MPG')
view(50,10)

% Изчисляваме сумарната квадратична грешка за регресионния модел

YF = b(1) + b(2)*x1 + b(3)*x2;
D=sum((y-YF).^2)
hold off