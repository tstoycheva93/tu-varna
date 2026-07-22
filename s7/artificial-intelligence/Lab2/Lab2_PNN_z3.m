load diabetes

T=ind2vec(T_train);

Mx=max(P_train,[],2);
P_test_norm=P_test./(Mx*ones(1,size(P_test,2)));
P_train_norm=P_train./(Mx*ones(1,size(P_train,2)));

Spread=1

net = newpnn(P_train_norm,T,Spread);

Y = net(P_test_norm);

Yc = vec2ind(Y);

Accuracy=100*length(find(Yc==T_test))/length(T_test)