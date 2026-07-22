function [Accuracy,xmin,Class] = train_and_test
started_at=fix(clock); % Recording the start time of the function

% Train data vector
Ztr = [1 1; 2 1; 1 2; 2 2; 2 3; 3 2; 3 3; 3 4; 4 3; 3 5; 3 6; 4 4; 4 5; 4 6; 5 6; 6 5]';

% Train target vector
Ttr = [1  1  1  1  2  2  2  2  2  3  3  3  3  3  3  3];

% Development data vector
Dev = [3 2; 1.2 2.1; 4.5 5.5; 4.4 3.3; 0.5 1.3]';

% Development  target vector
TDev = [2 1 3 2 1];      

% Test data vector
Zts = [3.5 3.1]';

% Test  target vector
Tts = 2;      

% Starting the training with PSO
[xmin] = pso_pnn_v(Ztr,Ttr,Dev,TDev);

% Testing the PNN with the obtained sigma value from the PSO
[prcntErrors, Class, Prblts] = PNN_probs_errf(xmin,Ztr,Ttr,Zts,Tts)

% Calculating accuracy
Accuracy = 100*(1-prcntErrors);

% Printing the start time and the end time of the execution of the function
 started_at
 ended_at=fix(clock)
