load zad1
Tc=vec2ind(T);

Co = {'or','*g','xm'};
lenX=length(Tc);
figure, plot(X(:,1),Co{1}), axis([0 7 0 7]), hold on
for k=2:lenX,
  plot(X(1,k),X(2,k),Co{Tc(k)})  
end
T = ind2vec(Tc);
Spread=1;
net = newpnn(X,T,Spread);

Xtest=[5 5; 1 5; 2 2; 3.7 4.1; 3.3 2.2]';
% Xtest=[3.5 4.2]';
% Xtest=[0.5 4.1]';
% Xtest=[5 3.5]';
% Xtest=[2.9 1.6]';
% Xtest=[4 4.6]';
plot(Xtest(1,:),Xtest(2,:),'k^') 
Y = net(Xtest);
Yc = vec2ind(Y)

for j=1:length(Yc);
 plot(Xtest(1,j),Xtest(2,j),Co{Yc(j)}) 
end