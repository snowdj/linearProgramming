# Problem 2 check
# Assignment 1
# CSCI 5654
# 9/10/13

var x1;
var x2m;
var x2p;

maximize zeta: (-3 * x1) + (5 * x2p) - (5 * x2m);
subject to w1: (-4 * x1) - x2m + x2p <= 4;
subject to w2: (-2 * x1) + x2m - x2p <= 8;
subject to w3: x1 + (2 * x2m) - (2 * x2p) <= 4;

solve;

display x1;
display x2m;
display x2p;

display zeta;

end;

