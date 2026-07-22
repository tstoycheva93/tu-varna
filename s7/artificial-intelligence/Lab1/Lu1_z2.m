load zad1

Xz=[X' sqrt(X(1,:).^2+X(2,:).^2)']';
X=Xz;
Tc=vec2ind(T);
% Tc(18)=3;
% Tc(18)=2;
X=X(:,1:19);
Tc=Tc(1:19);
T = ind2vec(Tc);


Xtest = [2.4, 2.1, 2.4; 2.7, 2.4, 2.5;]';

net = newp(X,T);
plotpv(X,T);

net.trainParam.epochs = 200;
% net.trainParam.goal = 0.000001;
net = train(net,X,T);
Y = net(Xtest);

a = sim(net,Xtest);

plotpv(Xtest,a);
point = findobj(gca,'type','line');
set(point,'Color','red');

hold on;
plotpv(X,T);
plotpc(net.IW{1},net.b{1});
hold off;

      

     