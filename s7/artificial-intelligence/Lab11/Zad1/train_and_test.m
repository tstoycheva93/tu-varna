function [Accuracy,xmin,Class] = train_and_test
started_at=fix(clock);

load zad1
% 
% Zts=[3.5 4.2]';
% Tts = 2;

% Zts=[0.5 4.1]';
% Tts = 2;

% Zts=[5 3.5]';
% Tts = 3;

% Zts=[2.9 1.6]';
% Tts = 1;

Zts=[4 4.6]';
Tts = 3;
      
[xmin] = pso_pnn_v(Ztr,Ttr,Zts,Tts);
[prcntErrors, Class, Prblts] = PNN_probs_errf(xmin,Ztr,Ttr,Zts,Tts)

Accuracy = 100*(1-prcntErrors);

 started_at;
 ended_at=fix(clock);
