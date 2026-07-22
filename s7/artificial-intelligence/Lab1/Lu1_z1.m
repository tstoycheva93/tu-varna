load zad1
Tc=vec2ind(T);
% Tc(22)=2;
T=ind2vec(Tc);
X=[X' sqrt(X(1,:).^2+X(2,:).^2)']';

Xtest = [2.4, 2.1, 2.4; 2.7, 2.4, 2.5]';

net = newp(X,T);
plotpv(X,T);

net.trainParam.epochs = 200;
net = train(net,X,T);

a = sim(net,Xtest);
hold on
plotpv(Xtest,a);
point = findobj(gca,'type','line');
set(point,'Color','red');

hold on;
plotpv(X,T);
plotpc(net.IW{1},net.b{1});
 hold off;

      

     