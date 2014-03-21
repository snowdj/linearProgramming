# Assignment 1, Problem 4
# Kelly Kaoudis
# CSCI 5654
# 9/12/13

var e1;
var e2;
var e3;
var e4;
var e5;
var e6;
var e7;
var e8;
var e9;
var e10;

#fixed maximum edge capacities as per the example
subject to w_e1: e1 <= 1;
subject to w_e2: e2 <= 2;
subject to w_e3: e3 <= 2;
subject to w_e4: e4 <= 1;
subject to w_e5: e5 <= 5;
subject to w_e6: e6 <= 1;
subject to w_e7: e7 <= 2;
subject to w_e8: e8 <= 2;
subject to w_e9: e9 <= 5;
subject to w_e10: e10 <= 1;

#sum of incoming flows == sum of outgoing flows
subject to n1: e1 + e2 = 0;
subject to n2: e1 = e3 + e4;
subject to n3: e2 + e3 = e5;
#no n4 in example
subject to n5: e4 + e5 = e6 + e7;
subject to n6: e10 = 0;
subject to n7: e8 = e6;
subject to n8: e7 + e8 = e9;
subject to n9: e9 + e10 = 0;

#nothing less than zero (no reverse flows)
subject to z1: e1 >= 0;
subject to z2: e2 >= 0;
subject to z3: e3 >= 0;
subject to z4: e4 >= 0;
subject to z5: e5 >= 0;
subject to z6: e6 >= 0;
subject to z7: e7 >= 0;
subject to z8: e8 >= 0;
subject to z9: e9 >= 0;
subject to z10: e10 >= 0;

#objective function
maximize total_flow: e1 + e2 + e3 + e4 + e5 + e6 + e7 + e8 + e9 + e10;

solve;

display e1;
display e2;
display e3;
display e4;
display e5;
display e6;
display e7;
display e8;
display e9;
display e10;

display total_flow;

end;
