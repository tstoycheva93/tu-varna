function [Accuracy,xmin,Class] = train_and_test
started_at=fix(clock);

load diabetes;

% Mx=max(P_train,[],2);
Ztr_norm=P_train;
Zts_norm=P_test;
% Ztr_norm=P_train./(Mx*ones(1,size(P_train,2)));
% Zts_norm=P_test./(Mx*ones(1,size(P_test,2)));

Ztr = P_train;
Ttr = T_train;

Zts = P_test;
Tts = T_test;      

[xmin] = pso_pnn_v(Ztr_norm,Ttr,Zts_norm,Tts);
[prcntErrors, Class, Prblts] = PNN_probs_errf(xmin,Ztr_norm,Ttr,Zts_norm,Tts);

Accuracy = 100*(1-prcntErrors);

 started_at
 ended_at=fix(clock)
