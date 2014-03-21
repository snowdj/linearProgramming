# Assignment 5, LP relaxation for ILP knapsack problem
# CSCI 5654, Fall 2013
# Kelly Kaoudis

# variables
var x0;
var x1;
var x2;
var x3;
var x4;
var x5;
var x6;

# constraints
subject to c1: 100 * x0 + 80 * x1 + 10 * x2 + 5 * x3 + 5 * x4 + .2 * x5 + 20 * x6 <= 3584.9;
subject to c2: x0 <= 10;
subject to c3: x1 <= 20;
subject to c4: x2 <= 120;
subject to c5: x3 <= 200;
subject to c6: x4 <= 500;
subject to c7: x5 <= 500;
subject to c8: x6 <= 550;
subject to c9: x0 >= 0;
subject to c10: x1 >= 0;
subject to c11: x2 >= 0;
subject to c12: x3 >= 0;
subject to c13: x4 >= 0;
subject to c14: x5 >= 0;
subject to c15: x6 >= 0;

maximize zeta: 700 * x0 + 400 * x1 + 12 * x2 + 3 * x3 + 4.5 * x4 + 1 * x5 + 150 * x6;

solve;

display zeta;
display x0;
display x1;
display x2;
display x3;
display x4;
display x5;
display x6;

display c1;
display c2;
display c3;
display c4;
display c5;
display c6;
display c7;
display c8;
