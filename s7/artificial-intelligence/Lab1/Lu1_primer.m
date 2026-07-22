X = [1 1; 2 1; 1 2; 2 2; 1.5 1.5; 2.5 1.5; 1.2 2.1; 2 2; 2 3; 3 2; 3 3; 3 4; 4.1 3.9; 2.7 2.2; 2.6 3.6; 3.6 2.4; 3.4 3.5; 3.8 4.9; 4 3; 3 5; 3 6; 4 4; 4 5; 4 6; 5 6; 6 5; 5 4]';
Tc = [1  1  1  1 1  1  1  1  1  2  2  2  2 2  2  2  2  2 2 1  1  1  1  1  1  1 1];

% X=X(:,1:19);
% Tc=Tc(1:19);
T = ind2vec(Tc);

plotpv(X,T);
Xtest = [2.4, 2.1, 2.4; 2.7, 2.4, 2.5];
% Xtest = [2.5 2.5]';
net = newp(X,T);

net.trainParam.epochs = 200;
net = train(net,X,T);

a = sim(net,Xtest);

plotpv(Xtest,a);
point = findobj(gca,'type','line');
set(point,'Color','red');

hold on;
plotpv(X,T);
plotpc(net.IW{1},net.b{1});
hold off;

      

     