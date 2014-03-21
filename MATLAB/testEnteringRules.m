%% Time and compare Bland's rule, the largest-coefficient rule, and (!) the greedy rule in my solver
%% Programming Assignment part III
%% CSCI 5654, Fall 2013
%% Kelly Kaoudis

function [largest_coef_total_time, blands_total_time] = testEnteringRules(m,n)

    A = randn(m,n);
    b = abs(randn(m,1));
    c = randn(n,1);

%% add slacks
    A_aug = [A eye(m,n)]; c_aug = [c; zeros(n,1)];

%% set up for our tests
    lg_bas = (n+1:m+n)'; lg_nonbas = (1:n)'; lg_etaFile = {eye(m,n), eye(m,n)};
    bland_bas = (n+1:m+n)'; bland_nonbas = (1:n)'; bland_etaFile = {eye(m,n), eye(m,n)};

    lg_final = 0; lg_unbounded = 0; lg_flg = -1; lg_count = 0; lg_optimum = 0; lg_st = 0; lg_st_long = 0; longLG = 0;
    bland_final = 0; bland_unbounded = 0; bland_flg = 0; bland_count = 0; bland_optimum = 0; bland_st = 0; bland_st_long = 0; longbland = 0;


%% timing
    largest_coef_total_time = 0.0; blands_total_time = 0.0;

%% start by timing our original implementation, which uses the largest coefficient rule
    fprintf('----Using largest coefficient rule----- \n');

    tstart = tic;
    while(lg_final == 0 && lg_unbounded == 0)
        for i = 1:m %% prevent degeneracy
            if (b(i) >= 0) 
                lg_flg = 1; 
            end
        end
    
        if (lg_flg) 
            [lg_x, lg_bas1, lg_nonbas1, lg_optVal, lg_final1, lg_unbounded1, lg_etaFileNew] = pivotWithEtaFactors(A_aug,b,c_aug,lg_bas,lg_nonbas,lg_etaFile, lg_optimum);
            lg_count = lg_count + 1;
        else  %% update this to add initialization phase in part 4?
                fprintf('Dictionary using largest-coef rule is degenerate \n');
                return;
        end
        
        %% update everything we need to look at for the next iteration
        lg_final = lg_final1;
        lg_unbounded = lg_unbounded1;
        lg_etaFile = lg_etaFileNew;
        lg_bas = lg_bas1;
        lg_nonbas = lg_nonbas1;    
        
        %% check for stalling
        if (lg_optimum == lg_optVal) 
           lg_st = lg_st + 1;
           lg_st_long = lg_st_long + 1;
           longLG = lg_st_long;
           fprintf('STALL at objective value %f!\n', lg_optVal); 
        else
            lg_st_long = 0;
        end
    end
    largest_coef_total_time = largest_coef_total_time + toc(tstart);

%% time Bland's rule in our solver
    fprintf('----Using Blands rule----- \n');

    tstart = tic;
    while(bland_final == 0 && bland_unbounded == 0)
        for i = 1:m
            if (b(i) >= 0)
                bland_flg = 1;
            end
        end
    
        if (bland_flg)
            [bland_x, bland_bas1, bland_nonbas1, bland_optVal, bland_final1, bland_unbounded1, bland_newEtaFile] = pivotBland(A_aug, b, c_aug, bland_bas, bland_nonbas, bland_etaFile, bland_optimum);
            bland_count = bland_count + 1;
        else %% this should not happen using Blands rule
            fprintf('Dictionary using Bland is degenerate \n');
            return;
    end
    
    %% update for next iter
        bland_final = bland_final1;
        bland_unbounded = bland_unbounded1;
        bland_etaFile = bland_newEtaFile;
        bland_bas = bland_bas1;
        bland_nonbas = bland_nonbas1;
        
        %% check for stalling
        if (bland_optimum == bland_optVal) 
           bland_st = bland_st + 1;
           bland_st_long = bland_st_long + 1;
           longbland = bland_st_long;
           fprintf('STALL at objective value %f!\n', bland_optVal); 
        else
            bland_st_long = 0;
        end
    
    end
    blands_total_time = blands_total_time + toc(tstart);

    fprintf('----------\n');
    
    if (lg_final)
        fprintf('Using the largest coefficient rule our solver took %f sec \n', largest_coef_total_time);
        fprintf('Number of steps with the largest coefficient rule: %i \n', lg_count);
        fprintf('Objective value: %f \n', lg_optVal);
        fprintf('Longest stalling streak: %i steps \n', longLG);
        fprintf('Number of stalling steps: %i \n', lg_st);
        fprintf('----------\n');
    end
    if(bland_final)
        fprintf('Using Blands rule our solver took %f sec \n', blands_total_time);
        fprintf('Number of steps with Blands rule: %i \n', bland_count);
        fprintf('Objective value: %f\n', bland_optVal);
        fprintf('Longest stalling streak: %i steps \n', longbland);
        fprintf('Number of stalls experienced: %i \n', bland_st);
        fprintf('----------\n');
    end
end