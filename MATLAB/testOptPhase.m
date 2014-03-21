%% test my optimization-phase solver
%% CSCI 5654, Fall 2013
%% Kelly Kaoudis

function testOptPhase(m,n)
%% m and n are our P-matrix dimensions

%P = randn(m,n);
%q = abs(randn(m,1));
%r = randn(n,1);

[P,q,r] = test7();

[optVal, optSolution] = solveOptimizationPhase(P, q, r);

%fprintf('Optimal Objective Value: %f \n', optVal);
%fprintf('Optimal solution vector: \n');
%optSolution


end