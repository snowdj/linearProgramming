
%% CSCI 5654
%% Kelly Kaoudis
%% Programming Assignment 1


function [pII,bas1,nonbas1,objval,isFinal,isUnbounded] = pivot(A,b,c,bas,nonbas)
%% Function: [bas1,nonbas1, objval] = pivot (A,b,c,bas,nonbas)
%% Inputs:
%%    (A,b,c) === the original problem is assumed to be of the form max c' x s.t. Ax = b, x >= 0
%%    bas, nonbas === current set of basic and non-basic indices.
%% Outputs:
%%    bas1, nonbas1 === new set of basic and non-basic indices
%%    objval === new objective value
%%    isFinal === the given dictionary is actually final (termination condition)
%%    isUnbounded === the given dictionary is actually unbounded (termination condition)

[m,n] = size(A);

isFinal = 0;
isUnbounded = 0;
%% Select the submatrices for Ab, Ai
Ab = A(:,bas)
Ai = A(:,nonbas)
%% split the objective row coefficients
cb = c(bas,:)';
ci = c(nonbas,:)';
%% compute pI
pII = (Ab'\cb')'

%% This is to initialize output variables for  the next dictionary.
bas1=bas;
nonbas1 = nonbas;
objval = pII * b %% compute current objective value.

%% compute objective row coefficients of the dictionary
chat = ci - pII*Ai
%% choose the largest index.
[cmax,enteringIndex] = max(chat)
if (cmax <= 1E-10)
       %% If largest index is non-negative, then we are done.
          disp('Final Dictionary');
             isFinal = 1;
                return;
            end

            fprintf(1,'Entering Index: %d',nonbas(enteringIndex));

            %% Now we start leaving variable analysis.
            %% Compute dictionary column corresponding to the entering variable analysis.

            %% Compute Aj and bhat columns

            Aj = - Ab\ A(:, nonbas(enteringIndex))
            bhat = Ab\b

            %% Initialize the leaving index

            leavingIndex = -1;
            leavingLim = Inf;

            %% Search for the leaving variable
            for i = 1:m
                    if (Aj(i,1) < 0)
                                  ll = -bhat(i,1)/Aj(i,1);
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

            fprintf(1,'Leaving Index: %d', bas(leavingIndex));

            %% Swap out the entering and leaving variable indices

            nonbas1(enteringIndex,1) = bas(leavingIndex,1);
            bas1(leavingIndex,1) = nonbas(enteringIndex,1);

            %% update the objective value.

            objval = pII * b + chat(enteringIndex) * leavingLim;
            
end
                                                                                
                                                                                    
%% That is all, Folks!

