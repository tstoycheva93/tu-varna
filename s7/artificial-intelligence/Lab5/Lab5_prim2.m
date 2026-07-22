load carsmall
x1 = Weight;
x2 = Acceleration; % Contains NaN data
y = MPG;
st1=(max(x1)-min(x1))/length(y);
st2=(max(x2)-min(x2))/length(y);

X = [ones(size(x1)) x1 x2];
b = regress(y,X); % Removes NaN data

Ix1=find((isnan(x1) + isnan(x2) + isnan(y))==0);
x1=x1(Ix1);
x2=x2(Ix1);
y=y(Ix1);

scatter3(x1,x2,y,'filled')
hold on
x1fit = min(x1):st1:max(x1);
x2fit = min(x2):st2:max(x2);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT;
mesh(X1FIT,X2FIT,YFIT);
xlabel('Weight')
ylabel('Acceleration')
zlabel('MPG')
view(50,10)

Yf = b(1) + b(2)*x1 + b(3)*x2;
D=sum((y-Yf).^2)
hold off