function [percentErrorsT_PNNG, Yclass, Rr] = PNN_probs_errf(sp,Ztr,Ttr,Dev,Tdev)

Model = PNNsimple2(Ztr,Ttr,sp); % Trains a PNN network named "Model"

[Yr, Rr] = PNNsim1r2(Model,Dev); % Testing the "Model" with our noisy data 

[i,j,s] = find(Yr);                  % Finds the non-zero elements in the output matrix
Yclass = i';                       % shows the results for the above training and test
                                    % sets we expect result Yclass = [1 2 3]

percentErrorsT_PNNG = sum(Tdev ~= Yclass)/numel(Tdev); %For the Test target set(Tts)