function [X1,res1,X2,res2,XInf,resInf] = solveLeastSquares(A,b)
%% Solves least squares for matrices A,b using three different norms and
%% output residuals.
%% X1: L1 norm best estimate.
%% X2: L2 norm best estimate.
%% XInf: Linfty norm best estimate.
%% res1: L1 norm residual (AX1 - b)
%% res2: L2 norm residual 
%% resInf: Linfty norm residual
%%
%%

[m n] = size(A);

%% Computation for L2 norm.
%% matlab \ operator does the trick.
X2=A\b;
res2=A*X2 - b;

%% Computation for L1 norm.
%% Lets prepare the matrices for solving linprog.

%%constraint
M1=[ A -eye(m); 
    -A -eye(m);
    zeros(m,n) -eye(m)];
%%RHS consts
r1=[b; -b; zeros(m,1)];
%% objective.
f1=[zeros(n,1); ones(m,1)];

%% Solving for the L1 minima
X11=linprog(f1,M1,r1);
%% Lets drop the extra variables
X1=X11(1:n);
%% Compute residuals
res1 = A*X1- b;


%%Computation for Linfty norm.

M2=[A -ones(m,1);
   -A -ones(m,1);
   zeros(1,n) -1];
r2=[b; -b; 0];
f2=[zeros(n,1); 1];

Xinf1=linprog(f2,M2,r2);
XInf = Xinf1(1:n);
resInf = A*XInf -b;


%%Done.
end