%% Put the csv data in ARIMA form and do least squares, L1, and Linf regression
%% Assignment 5, Problem 1
%% CSCI 5654, Fall 2013
%% Kelly Kaoudis

function [] = arimaRegressionProblem1()

%% read in the .csv data to be modeled
    data = csvread('~/Development/Git/projects/linearProgramming/assignment5/insulinGlucose1.csv',1,1);

    n = 2;
    glucose = data(1 : n : end); %%output: x(t) == glucose levels
    insulin = data(1 : n : end); %%input: u(t) == amount of insulin delivered
   % time = [1:size(glucose)]';
    [m,z] = size(glucose);
    
    b = zeros(1,m);
    A = zeros(m,7);
    
    %% x(t)
   
   for i = 1:size(glucose)
       b(i) = glucose(i);
       A(i,1) = 1;
   end
 
   A(1,2) = 0; %x(0-1)
   A(1,3) = 0; %x(0-2)
   A(1,4) = insulin(1);
   A(1,5) = 0; %u(0-1)
   A(1,6) = 0; %u(0-2)
   A(1,7) = 0; %u(0-3)
   
   A(2,2) = glucose(2);
   A(2,3) = 0; %x(1-2)
   A(2,4) = insulin(2);
   A(2,5) = insulin(1);
   A(2,6) = 0; %u(1-2)
   A(2,7) = 0; %u(1-3)
   
   A(3,2) = glucose(2);
   A(3,3) = glucose(1);
   A(3,4) = insulin(3);
   A(3,5) = insulin(2);
   A(3,6) = insulin(1);
   A(3,7) = 0; %u(2-3)
   
   A(4,2) = glucose(3);
   A(4,3) = glucose(2);
   A(4,4) = insulin(4);
   A(4,5) = insulin(3);
   A(4,6) = insulin(2);
   A(4,7) = insulin(1);
      
   A_row = 5;
   
   for i = 4:size(glucose)
       A(A_row, 2) = glucose(i-1);  
       A(A_row, 3) = glucose(i-2);

       A(A_row, 4) = insulin(i);
       A(A_row, 5) = insulin(i-1);
       A(A_row, 6) = insulin(i-2);
       A(A_row, 7) = insulin(i-3);
       
       A_row = A_row + 1;
       if A_row > size(glucose)
            break;
       end
   end
 %  [x,y] = size(A)
 %  [x1,y1] = size(b)
   
   b = b';
   
   [X1,res1,X2,res2,XInf,resInf] = solveLeastSquares(A,b);
   
   fprintf('Best estimates \n');
   disp('---------- \n');
   fprintf('L1 coefficient: %f \n', X1);
   disp('---------- \n');
   fprintf('L2 coefficient: %f \n', X2);
   disp('---------- \n');
   fprintf('Linf coefficient: %f \n', XInf);
end