# Assignment 5, LP relaxation for reduced ILP knapsack prob
# CSCI 5654, Fall 2013
# Kelly Kaoudis

# vars
var x0;
var x1;
var x2;
var x3;
var x4;
var x5;

#constraints
subject to c0: 700*x0 + 400*x1 + 10*x2 + 5*x3 + 5*x4 + .2*x5 <= 36;
subject to c1: 100*x0 + 80*x1 + 10*x2 + 5*x3 + 5*x4 + .2*x5 = 4.9;
subject to c2: x0 <= 10;
subject to c3: x1 <= 20;
subject to c4: x2 <= 120;
subject to c5: x3 <= 200;
subject to c6: x4 <= 500;
subject to c7: x5 <= 500;
subject to c8: x0 >= 0;
subject to c9: x1 >= 0;
subject to c10: x2 >= 0;
subject to c11: x3 >= 0;
subject to c12: x4 >= 0;
subject to c13: x5 >= 0;

maximize zeta: 700*x0 + 400*x1 + 12*x2 + 3*x3 + 4.5*x4 + x5;

solve;

display zeta;
display x0;
display x1;
display x2;
display x3;
display x4;
display x5;
