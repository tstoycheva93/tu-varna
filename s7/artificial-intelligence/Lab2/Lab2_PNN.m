X = [1 1; 2 1; 1 2; 2 2; 2 3; 3 2; 3 3; 3 4; 4 3; 3 5; 3 6; 4 4; 4 5; 4 6; 5 6; 6 5]';
Tc = [1   1    1     1    2     2    2    2  2    3    3    3    3    3    3    3  ];
Co = {'or','*g','xm'};
lenX=length(Tc);
figure, plot(X(:,1),Co{1}), axis([0 7 0 7]), hold on
for k=2:lenX,
  plot(X(1,k),X(2,k),Co{Tc(k)})  
end
T = ind2vec(Tc);
Spread=1
net = newpnn(X,T,Spread);

Xtest=[3.5 3.1]';
plot(Xtest(1,:),Xtest(2,:),'k^') 
Y = net(Xtest);
Yc = vec2ind(Y)

plot(Xtest(1,:),Xtest(2,:),Co{Yc}) 