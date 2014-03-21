# Assignment 2, Problem 4
# Kelly Kaoudis
# CSCI 5654
# 9/26/13

# each variable in the distribution
var pn5;
var pn4;
var pn3;
var pn2;
var pn1;
var p0;
var p1;
var p2;
var p3;
var p4;
var p5;

# p_j (j = -5 ... 5) >= 0
subject to z1: pn5 >= 0;
subject to z2: pn4 >= 0;
subject to z3: pn3 >= 0;
subject to z4: pn2 >= 0;
subject to z5: pn1 >= 0;
subject to z6: p0 >= 0;
subject to z7: p1 >= 0;
subject to z8: p2 >= 0;
subject to z9: p3 >= 0;
subject to z10: p4 >= 0;
subject to z11: p5 >= 0;

# limits on the mean
# -2 <= \sigma (j*p_j) (j = -5 ... 5) <= 2
subject to mean_a: ( (-5)*pn5 + (-4)*pn4 + (-3)*pn3 + (-2)*pn2 + (-1)*pn1 + 0*p0 + 1*p1 + 2*p2 + 3*p3 + 4*p4 + 5*p5) <= 2;
subject to mean_b: -2 <= ( (-5)*pn5 + (-4)*pn4 + (-3)*pn3 + (-2)*pn2 + (-1)*pn1 + 0*p0 + 1*p1 + 2*p2 + 3*p3 + 4*p4 + 5*p5);

#limits on the moments
# 5 <= \sigma (j^2 * p_j) (j = -5 ... 5) <= 10
subject to moment_a: ( (-5)*(-5)*pn5 + (-4)*(-4)*pn4 + (-3)*(-3)*pn3 + (-2)*(-2)*pn2 + (-1)*(-1)*pn1 + 0*p0 + 1*p1 + 4*p2 + 9*p3 + 16*p4 + 25*p5) <= 10;
subject to moment_b: 5 <= ( 25*pn5 + 16*pn4 + 9*pn3 + 4*pn2 + 1*pn1 + 0*p0 + 1*p1 + 4*p2 + 9*p3 + 16*p4 + 25*p5 );

# probablities
# \sigma p_j (j = -5 ... 5) = 1
subject to sum: (pn5 + pn4 + pn3 + pn2 + pn1 + p0 + p1 + p2 + p3 + p4 + p5) = 1;

# modes at 2, -2: enforce a (dual-mode) partial ordering on the set of variables
subject to mode_1: p2 = pn2;
subject to mode_2: p2 >= p1;
subject to mode_3: p2 >= p0;
subject to mode_4: p2 >= pn1;
subject to mode_5: p2 >= pn3;
subject to mode_6: p2 >= pn4;
subject to mode_7: p2 >= pn5;
subject to mode_8: p2 >= p3;
subject to mode_9: p2 >= p4;
subject to mode_10: p2 >= p5;

#objective function
maximize zeta: p0;

solve;

display zeta;
display pn5;
display pn4;
display pn3;
display pn2;
display pn1;
display p0;
display p1;
display p2;
display p3;
display p4;
display p5;


