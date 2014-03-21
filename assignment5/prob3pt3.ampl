var x2;
var x3;
var x4;
var x5;

subject to c0: 12*x2 + 5*x3 + 5*x4 + .2*x5 <= 4.9;
subject to c1: 10*x2 + 3*x3 + 4.5*x4 + x5 <= 36;
subject to c2: x2 <= 120;
subject to c3: x3 <= 200;
subject to c4: x4 <= 500;
subject to c5: x5 <= 500;
subject to c6: x2 >= 0;
subject to c7: x3 >= 0;
subject to c8: x4 >= 0;
subject to c9: x5 >= 0;

maximize zeta: 12*x2 + 3*x3 + 4.5*x4 + x5;

solve;

display zeta;
display x2;
display x3;
display x4;
display x5;
