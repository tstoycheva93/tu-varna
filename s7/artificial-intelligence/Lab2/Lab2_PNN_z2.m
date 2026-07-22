load diabetes

T=ind2vec(T_train);

Spread=1;   

net = newpnn(P_train,T,Spread);

Y = net(P_test);

Yc = vec2ind(Y);

Accuracy=100*length(find(Yc==T_test))/length(T_test)