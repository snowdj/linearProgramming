
function testMyPivot(m,n)

%% Create original problem in standard form with m constraints over n variables.
    Ahat = randn(m,n);
    b = abs(randn(m,1)); %% made sure all entries in b are non-negative so no initialization is needed.
    chat = randn(n,1);

%% Create augmented matrices with slack variables added.
    A = [ Ahat eye(m)];
    c = [ chat; zeros(m,1)]

%% start off the basis and non basic indices
    bas = (n+1:m+n)'; %% basis is {n+1..n+m}
    nonbas = (1:n)'; %% nonbasic are {1..n}
    etaFile = {eye(m), eye(m)}; %% Start eta file with two identity matrices

    count = 0; %% Count of the number of steps
    isFinal = 0; %% Flags for isFinal
    isUnbounded = 0; %% isUnbounded
    oldPivotTime = 0.0;
    newPivotTime = 0.0;

    while (isFinal == 0 && isUnbounded == 0)
        tstart = tic;
        [rhs1, bas1, nonbas1, objVal1,  isFinal1, isUnbounded1] = pivot(A,b,c,bas,nonbas); %% Use my old pivoting code.
        oldPivotTime = oldPivotTime + toc(tstart);

        tstart = tic;
        
        %% Compute the same stuff with my new code.
        [rhs2, bas2, nonbas2, objVal2, isFinal2, isUnbounded2, etaFileNew] = pivotWithEtaFactors(A,b,c,bas,nonbas,etaFile);
        newPivotTime = newPivotTime + toc(tstart);
        count = count + 1;

        %% Do the comparisons
        fprintf ('Comparisons after %d pivot steps ------> \n', count);

        %% Just check if there are differences between basic indices
        fprintf ( 'Comparing bas1 with bas2 -- Difference is %d \n',  max(abs(bas1 - bas2)));
        assert ( max(abs(bas1 - bas2)) <= 0.0);
    
        %% Are there differences with the non-basic indices.
        fprintf ( 'Comparing nonbas1 with nonbas2 : %d \n', max(abs(nonbas1 - nonbas2)));
        assert ( max(abs(nonbas1 - nonbas2)) <= 0.0);
    
        %% Do the objective values match?
        fprintf ('Difference in objectives is %f \n', objVal1 - objVal2);
                             
        assert ( objVal1  - objVal2 <= 1e-08);
        assert (objVal2 - objVal1 <= 1e-08);
    
        %% Do the two routines agree with respect to the status flags?                                      
        fprintf ('Difference in status flags: Final %d, Unb. %d \n', isFinal1 - isFinal2, isUnbounded1-isUnbounded2);

        assert( isFinal1 == isFinal2);
        assert(isUnbounded1 == isUnbounded2);

        %% Prepare for one more iteration and test.
        isFinal = isFinal1;
        isUnbounded = isUnbounded1;
        etaFile = etaFileNew;
        bas = bas1;
        nonbas = nonbas1;

    end

    fprintf (' Time taken without basis update: %f \n', oldPivotTime);
    fprintf (' Time taken with eta factors: %f \n', newPivotTime);

    if (isFinal)
    %% Compare answer with the linprog function in MATLAB
        fprintf ('Optimal Objective Value is %f (%f) \n', objVal1, objVal2);

        [x,fval] = linprog(-chat,Ahat,b,[],[],zeros(n,1));
        fprintf ('Optimal Objective Value according to Linprog is  %f \n', -fval);
        
        fprintf ('Our b-vectors are: \n');
        fprintf('Old Code: \n');
        rhs1
        fprintf('New Code: \n');
        rhs2
    end


end
