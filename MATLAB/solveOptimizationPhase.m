%% Programming Assignment: Part II
%% Optimization-phase LP solver
%% CSCI 5654, Fall 2013
%% Kelly Kaoudis

function [optVal, optSolution] = solveOptimizationPhase(P, q, r)
%% inputs
%% P: problem matrix without slacks (e.g. Ai from our previous solver)
%% q: RHS
%% r: objective-row coefficients
%% outputs
%% optVal: zeta of final-form LP dictionary
%% optSolution: final values of original problem constants (no slacks)

    [m,n] = size(P);
    
    % add slack variables to the problem
    A = [P eye(m,n)];
    c = [r; zeros(n,1)];
    
    bas = (n+1:m+n)';
    nonbas = (1:n)';
    nb = nonbas;
    etaFile = {eye(m,n), eye(m,n)};
    
    final = 0;
    unbounded = 0;
    flg = -1;
    opt = 0;
    
    while(final == 0 && unbounded == 0)
        for i = 1:m
            if (q(i) >= 0) 
                flg = 1; 
            end
        end
    
        if (flg) 
            [x, bas1, nonbas1, optVal, final1, unbounded1, etaFileNew] = pivotWithEtaFactors(A,q,c,bas,nonbas,etaFile,opt);
        else  %% update this to add initialization phase in part 4?
                fprintf('Dictionary is degenerate \n');
                return;
        end
        
        %% update everything we need to look at for the next iteration
        final = final1;
        unbounded = unbounded1;
        etaFile = etaFileNew;
        bas = bas1;
        nonbas = nonbas1;        
    end
    
    optSolution = zeros(1, n); % initialize
    
    %% compare ending nonbas to starting nonbas indices of c: for all continuing nonbas variables, leave a zero. otherwise, take the bas value in the final RHS
    for i = 1:n
       if ( nb(i) ~= nonbas(i) ) 
            optSolution(i) = x(i);
       else
           cTx(i) = 0.0;
       end
        
    end
    
    %% compare our answers with linprog's results and based on this comparison, return
    if final 
        [sol, zeta] = linprog(-r,P,q,[],[],zeros(n,1));
        
        fprintf('optVal = %f and -zeta = %f \n', optVal, -zeta);
        
        %fprintf('Our Answer (cTx using revised simplex maximisation): \n');
        %cTx'
        fprintf('Our Answer: \n');
       % optSolution
       % fprintf('Our Coefficients: \n')
       % coefs
       % fprintf('Their Answer (cTx using interior point method minimisation of the negative): \n');
       % sol'
    end

    %% return zeta (optVal) and our nice optimal orig vars (optSolution)
end