function [xmin] = pso_pnn_v(TrainData,TargetClass,Xtest,XtargetClass)

rand('state',sum(100*clock)); % Different random generator seeds per execution
% Initializing variables
refresh = 10; %intermediate output will be produced after "refresh" iterations. 
success = 0; % Success flag
PopSize = 10; % Size of the swarm
MaxIt = 1000; % Maximum number of iterations
iter = 0; % Iterations’counter
fevals = 0; % Function evaluations’ counter
maxw = 1.2; % Maximum inertia weight’s value
minw = 0.1; % Minimum inertia weight’s value
weveryit = floor(0.75*MaxIt); % Inertia decr. step
c1 = 1.2; % PSO parameter C1
c2 = 1.2; % PSO parameter C2
inertdec = (maxw-minw)/weveryit; % Inertia weight’s decrement
w = maxw; % initial inertia weight
f = 'PNN_probs_errf'; % Objective Function
dim = 1; % Dimension of the problem
upbnd = 100; % Upper bound for init. of the swarm
lwbnd = -100; % Lower bound for init. of the swarm
GM = 0; % Global minimum (used in the stopping criterion)
ErrGoal = 1e-3; % Desired accuracy

% Initializing swarm and velocities
popul = rand(dim, PopSize)*(upbnd-lwbnd) + lwbnd;
vel = rand(dim, PopSize);
% Evaluate initial population
for i = 1:PopSize,
fpopul(i) = feval(f, popul(:,i),TrainData,TargetClass,Xtest,XtargetClass);
fevals = fevals + 1;
end
% Initializing Best positions’ matrix and
% the corresponding function values
bestpos = popul;
fbestpos = fpopul;
% Finding best particle in initial population
[fbestpart,g] = min(fpopul);
lastbpf = fbestpart;
% SWARM EVOLUTION LOOP START
while (success == 0) && (iter < MaxIt), %while (success == 0) & (iter < MaxIt),
iter = iter + 1;
% Update the value of the inertia weight w
if (iter<=weveryit)
w = maxw - (iter-1)*inertdec;
end
% VELOCITY UPDATE
for i=1:PopSize,
A(:,i) = bestpos(:,g);
end
R1 = rand(dim, PopSize);
R2 = rand(dim, PopSize);
vel = w*vel + c1*R1.*(bestpos-popul) + c2*R2.*(A-popul);
% SWARMUPDATE
popul = popul + vel;
% Evaluate the new swarm
for i = 1:PopSize,
fpopul(i) = feval(f,popul(:, i),TrainData,TargetClass,Xtest,XtargetClass);
fevals = fevals + 1;
end
% Updating the best position for each particle
changeColumns = fpopul < fbestpos;
fbestpos = fbestpos.*(~changeColumns) + fpopul.*changeColumns;
bestpos(:, find(changeColumns)) = popul(:, find(changeColumns));
% Updating index g
[fbestpart, g] = min(fbestpos);
% Checking stopping criterion
%if abs(fbestpart-lastbpf) <= ErrGoal
if abs(fbestpart-GM) <= ErrGoal
success = 1;
else
lastbpf = fbestpart;
end

%----Output section----------------------------------------------------------

  if (refresh > 0)
    if (rem(iter,refresh) == 0)
       fprintf(1,'Iteration: %d,  Result: %f,  Solution:',iter,fbestpos(g));
       sl = popul(:,g);
       for i=1:dim
        fprintf(1,' %f',sl(i));
       end
       fprintf(1,'\n');
    end
  end

end
% SWARM LOOP END
% Output arguments
xmin = popul(:,g);
fxmin = fbestpos(g);


% Loop for recording the data from fxmin and xmin
RunStats = [success iter fevals];
 % PRINT DETECTED SOLUTION ON SCREEN
 fprintf(' SUCCESS=%1d :: SOLUTION X*=(', success);

for i=1:dim
    fprintf(' %15.5e', xmin(i));
end
  fprintf(' ) :: F(X*)=%12.5e :: ITER=%5d\n', fxmin, iter);
  disp(' ');


 %===========================
 % PRINT AVERAGED STATISTICS
 %===========================
 fprintf('\nAVERAGED STATISTICS:\n');
 SucRunStats = RunStats(RunStats(:,1)==1,:);
 fprintf('SUCCESSES = %3d\n', sum(RunStats(:,1)));
 fprintf('MEAN ITERATIONS = %8.2f\n', mean(SucRunStats(:,2)));
 fprintf('StD ITERATIONS = %8.2f\n', std(SucRunStats(:,2)));
 fprintf('MEAN FUNC.EVAL. = %8.2f\n', mean(SucRunStats(:,3)));
 fprintf('StD FUNC.EVAL. = %8.2f\n', std(SucRunStats(:,3)));
