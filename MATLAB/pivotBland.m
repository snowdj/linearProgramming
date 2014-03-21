%% CSCI 5654
%% Kelly Kaoudis
%% Programming Assignment 1, Part 3

%% test Bland's rule

function [b, bas1, nonbas1, zeta, isFinal, isUnbounded, newEtaFile] = pivotBland(A, b, c, bas, nonbas, etaFile, optimum)

%% etaFile: the set of augmented I-matrices we create a new element of on each revised-factorized simplex iteration
%% newEtaFile: our updated set of augmented I-matrices following the pivot

    [m,n] = size(A);
    isFinal = 0;
    isUnbounded = 0;
        
%% A = [Ai Ab] and c = [ci cb]   
%% get our eta cell array for the basis started (refactor each iteration from original problem data no matter what, because we don't need to carry that computation over)
    [L,U] = lu( A(:,bas) );
    newEtaFile = { L, U };
    
   % start our refactored Ab_inv without eta-columns
    eta = inv(newEtaFile{1} * newEtaFile{2});
    
%% update our current basis
    for i = 3:size(etaFile)
        eta = eta * etaFile{i}; % left-multiply Ab_inv (L^-1 * U^-1) * e1 * e2 * ... * en
    end

   pII = (eta' * c(bas,:))';
       
   zeta = pII * b;
    
   bas1 = bas;
   nonbas1 = nonbas;

%% compute objective row coefficients of the dictionary
    chat = c(nonbas,:)' - pII*A(:,nonbas);
    
%% choose the first index with a positive value for our entering variable
    cmax = 0;
    enteringIndex = -1;
    
    [idx_end, sz] = size(nonbas);
    
    for i = 1:idx_end
       if (chat(i) >= 0)
           cmax = chat(i);
           enteringIndex = i;
           break;
       end
    end

    if ( (enteringIndex == -1) || (cmax <= 1E-10) )
       %% If largest index is non-negative, then we are done.
       disp('Final Dictionary');
       isFinal = 1;
       return;
    end

    fprintf(1,'Entering Index: %d \n',nonbas(enteringIndex));

%% Compute dictionary column Aj corresponding to the entering variable analysis, with which we will rank-1 update our eta file and therefore our basis for this iteration.
    Ajhat = - eta * A(:, nonbas(enteringIndex));
       
%% right hand side (b-vector) update
    bhat = eta * b;

%% Initialize the leaving index
    leavingIndex = -1;
    leavingLim = Inf;

%% Search for the leaving variable: choose the most constraining ratio
    for i = 1:m
        if (Ajhat(i) < 0)
            
            ll = -bhat(i,1)/Ajhat(i);
            
            if (ll < leavingLim - 1E-8 || ( ll >= leavingLim - 1E-08 && ll <= leavingLim + 1E-08 && bas(i) <= bas(leavingIndex) ))
                leavingLim = ll;
                leavingIndex = i;
            end
        end
    end
    
    if (leavingIndex == -1)
        disp('Dictionary Unbounded: no leaving variable');
        isUnbounded = 1;
        return;
    end

    fprintf(1,'Leaving Index: %d \n', bas(leavingIndex));

    %% Swap out the entering and leaving variable indices: this plus our eta-column Ajhat selected by entering variable analysis is all we need to keep going.
    nonbas1(enteringIndex,1) = bas(leavingIndex,1);
    bas1(leavingIndex,1) = nonbas(enteringIndex,1);

    %% update the objective value.
    zeta = pII * b + chat(enteringIndex) * leavingLim;
        
%% add our enteringIndex - aj-hat vector to our new eta matrix
    newEta = speye(m);
    newEta(:,enteringIndex) = Ajhat;
    newEtaFile{end+1} = newEta;
    
%% update c'x --> we'll return a vector of c'x where x > 0, and 0 otherwise, for our solution-vector.
    c = chat * eta * b;
    b = eta * b;
    
end
                                                                                                                                                                    
%% That is all, Folks!