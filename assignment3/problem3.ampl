# Problem 3 redo from Assignment 1
# I previously forgot the key that profit = revenue - cost. 
# Therefore, no more homework at 3 am for me.
# Also, re-running with GLPK and the --dual and --exact flags in order to determine exact shadow costs
# for problem 2A and 2B from this week's homework.
# 10/7/13

# variables
var x1;
var x2;
var x3;
var x4;
var x5;
var x6;
var x7;
var x8;
var x9;
var x10;
var x11;
var x12;
var x13;
var x14;
var x15;
var x16;
var x17;
var x18;
var x19;
var x20;
var x21;
var x22;
var x23;
var x24;
var x25;

# constraints
subject to z1: x1 >= 0;
subject to z2: x2 >= 0;
subject to z3: x3 >= 0;
subject to z4: x4 >= 0;
subject to z5: x5 >= 0;
subject to z6: x6 >= 0;
subject to z7: x7 >= 0;
subject to z8: x8 >= 0;
subject to z9: x9 >= 0;
subject to z10: x10 >= 0;
subject to z11: x11 >= 0;
subject to z12: x12 >= 0;
subject to z13: x13 >= 0;
subject to z14: x14 >= 0;
subject to z15: x15 >= 0;
subject to z16: x16 >= 0;
subject to z17: x17 >= 0;
subject to z18: x18 >= 0;
subject to z19: x19 >= 0;
subject to z20: x20 >= 0;
subject to z21: x21 >= 0;
subject to z22: x22 >= 0;
subject to z23: x23 >= 0;
subject to z24: x24 >= 0;
subject to z25: x25 >= 0;

subject to minA: 2.563*x1 + 12.236*x3 + 6.895*x6 + 3.488*x7 + 9.731*x11 + 1.980*x13 + 10.160*x16 + 11.672*x21 + 3.049*x22 >= 1500;
subject to minB: 4.307*x2 + 6.581*x8 + 8.993*x9 + 11.730*x14 + 15.650*x17 + 10.877*x23 + 10.967*x24 >= 4500;
subject to minC: 6.422*x4 + 11.481*x10 + 9.270*x15 + 1.961*x18 + 12.137*x25 >= 1000;
subject to minD: 8.796*x5 + 3.451*x12 + 9.300*x19 + 3.657*x20 >= 500; 

subject to maxA: 2.563*x1 + 12.236*x3 + 6.895*x6 + 3.488*x7 + 9.731*x11 + 1.980*x13 + 10.160*x16 + 11.672*x21 + 3.049*x22 <= 3500;
subject to maxB: 4.307*x2 + 6.581*x8 + 8.993*x9 + 11.730*x14 + 15.650*x17 + 10.877*x23 + 10.967*x24 <= 6500;
subject to maxC: 6.422*x4 + 11.481*x10 + 9.270*x15 + 1.961*x18 + 12.137*x25 <= 3000;
subject to maxD: 8.796*x5 + 3.451*x12 + 9.300*x19 + 3.657*x20 <= 2500;

subject to minTech: 2.563*x1 + 12.236*x3 + 6.895*x6 + 9.731*x11 + 3.451*x12 + 1.980*x13 + 11.730*x14 + 1.961*x18 + 10.967*x24 >= 0;
subject to minFin: 4.307*x2 + 6.422*x4 + 6.581*x8 + 8.993*x9 + 11.481*x10 + 3.657*x20 + 12.137*x25 >= 0;
subject to minPC: 8.796*x5 + 3.488*x7 + 9.270*x15 + 11.672*x21 >= 0;
subject to minAuto: 10.160*x16 + 15.650*x17 + 9.300*x19 + 3.049*x22 + 10.877*x23 >= 0;

subject to maxTech: 2.563*x1 + 12.236*x3 + 6.895*x6 + 9.731*x11 + 3.451*x12 + 1.980*x13 + 11.730*x14 + 1.961*x18 + 10.967*x24 <= 3000;
subject to maxFin: 4.307*x2 + 6.422*x4 + 6.581*x8 + 8.993*x9 + 11.481*x10 + 3.657*x20 + 12.137*x25 <= 4000;
subject to maxPC: 8.796*x5 + 3.488*x7 + 9.270*x15 + 11.672*x21 <= 5000;
subject to maxAuto: 10.160*x16 + 15.650*x17 + 9.300*x19 + 3.049*x22 + 10.877*x23 <= 7000;

subject to minEco: 2.563*x1 + 4.307*x2 + 12.236*x3 + 6.422*x4 + 6.895*x6 + 8.993*x9 + 11.481*x10 + 11.730*x14 + 9.270*x15 + 10.160*x16 + 1.961*x18 + 11.672*x21 + 3.049*x22 + 10.967*x24 >= 9000;
#subject to maxEco: 2.563*x1 + 4.307*x2 + 12.236*x3 + 6.422*x4 + 6.895*x6 + 8.993*x9 + 11.481*x10 + 11.730*x14 + 9.#270*x15 + 10.160*x16 + 1.961*x18 + 11.672*x21 + 3.049*x22 + 10.967*x24 <= 10000;

subject to totalToSpend: 2.563*x1 + 4.307*x2 + 12.236*x3 + 6.422*x4 + 8.796*x5 + 6.895*x6 + 3.488*x7 + 6.581*x8 + 8.998*x9 + 11.481*x10 + 9.731*x11 + 3.451*x12 + 1.980*x13 + 11.730*x14 + 9.270*x15 + 10.160*x16 + 15.650*x17 + 1.961*x18 + 9.300*x19 + 3.657*x20 + 11.672*x21 + 3.049*x22 + 10.877*x23 + 10.967*x24 + 12.137*x25 <= 10000;

# objective
maximize zeta: (1.451 - 2.563)*x1 + (2.683 - 4.307)*x2 + (8.844 - 12.236)*x3 + (5.898 - 6.422)*x4 + (6.454 - 8.796)*x5 + (6.611 - 6.895)*x6 + (2.102 - 3.488)*x7 + (5.709 - 6.581)*x8 + (4.519 - 8.993)*x9 + (7.176 - 11.481)*x10 + (7.231 - 9.731)*x11 + (3.323 - 3.451)*x12 + (1.343 - 1.980)*x13 + (6.075 - 11.730)*x14 + (5.718 - 9.270)*x15 + (7.442 - 10.160)*x16 + (8.754 - 15.650)*x17 + (1.234 - 1.961)*x18 + (4.680 - 9.300)*x19 + (3.568 - 3.657)*x20 + (7.229 - 11.672)*x21 + (2.819 - 3.049)*x22 + (9.589 - 10.877)*x23 + (7.870 - 10.967)*x24 + (6.497 - 12.137)*x25;

solve;

# display

display zeta;
display x1;
display x2;
display x3;
display x4;
display x5;
display x6;
display x7;
display x8;
display x9;
display x10;
display x11;
display x12;
display x13;
display x14;
display x15;
display x16;
display x17;
display x18;
display x19;
display x20;
display x21;
display x22;
display x23;
display x24;
display x25;

end;
