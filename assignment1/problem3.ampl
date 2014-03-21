# Assignment 1, Problem 3
# Kelly Kaoudis
# CSCI 5654
# 9/12/13

#each item we can invest 0 or more dollars in is a variable
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

#want no negative values (in the case of minimizing price, not specifying these means all x_i can go to neg \infty)
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

# minimum constraints by risk category
subject to min_perc_A: x1 + x3 + x6 + x7 + x11 + x13 + x16 + x21 + x22 >= 1500; # 15% of t = A min
subject to min_perc_B: x2 + x8 + x9 + x14 + x17 + x23 + x24 >= 4500; # 45% of t = B min
subject to min_perc_C: x4 + x10 + x15 + x18 + x25 >= 1000; # 10% of C min
subject to min_perc_D: x5 + x12 + x19 + x20 >= 500;  # 5% of D minimum

#maximum constraints by risk category
subject to max_perc_A: x1 + x3 + x6 + x7 + x11 + x13 + x16 + x21 + x22 <= 3500; # max A 35% of total 
subject to max_perc_B: x2 + x8 + x9 + x14 + x17 + x23 + x24 <= 6500; # max B 65% of total 
subject to max_perc_C: x4 + x10 + x15 + x18 + x25 <= 3000; # max C 30% of total
subject to max_perc_D: x5 + x12 + x19 + x20 <= 2500; # max D 25% of total

#max amounts from each industry
subject to max_amt_tech: x1 + x3 + x6 + x11 + x12 + x13 + x14 + x18 + x24 <= 3000; # 30% of total
subject to max_amt_finance: x2 + x4 + x8 + x9 + x10 + x20 + x25 <= 4000; # 40% of total
subject to max_amt_petrochem: x5 + x7 + x15 + x21 <= 5000; # 50% of total
subject to max_amt_automobile: x16 + x17 + x19 + x22 + x23 <= 7000; # 70% of total

#min amounts from each industry
subject to min_amt_tech: x1 + x3 + x6 + x11 + x12 + x13 + x14 + x18 + x24 >= 0;
subject to min_amt_finance: x2 + x4 + x8 + x9 + x10 + x20 + x25 >= 0;
subject to min_amt_petrochem: x5 + x7 + x15 + x21 >= 0;
subject to min_amt_automobile: x16 + x17 + x19 + x22 + x23 >= 0;

#eco versus non eco
subject to max_amt_eco: x1 + x2 + x3 + x4 + x6 + x9 + x10 + x14 + x15 + x16 + x18 + x21 + x22 + x24 <= 10000;
subject to min_amt_eco: x1 + x2 + x3 + x4 + x6 + x9 + x10 + x14 + x15 + x16 + x18 + x21 + x22 + x24 >= 1000;
subject to max_amt_not_eco: x5 + x7 + x8 + x11 + x12 + x13 + x17 + x19 + x20 + x23 + x25 <= 1000; # max 10%
subject to min_amt_not_eco: x5 + x7 + x8 + x11 + x12 + x13 + x17 + x19 + x20 + x23 + x25 >= 0; # min none

#we only have 10,000 USD to invest so we can't exceed that
subject to total_investment: x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10 + x11 + x12 + x13 + x14 + x15 + x16 + x17 + x18 + x19 + x20 + x21 + x22 + x23 + x24 + x25 <= 10000;

#original (unbounded) objective function
# maximize profit: 1.45145290118959*x1 + 2.68284307457084*x2 + 8.84350676629698*x3 + 5.89784748298141*x4 + 
# 6.45406134403266*x5 + 6.61069262161026*x6 + 2.10204863999832*x7 + 5.70868050198876*x8 + 
# 4.51895932192581*x9 + 7.17550058007351*x10 + 7.23060131085765*x11 + 3.32306903116085*x12 + 
# 1.34329474429347*x13 + 6.07547281958368*x14 + 5.71814081155596*x15 + 7.44228736304717*x16 + 
# 8.75423495145147*x17 + 1.23432033054255*x18 + 4.67994249822406*x19 + 3.56849776778077*x20 + 
# 7.22874282100628*x21 + 2.81942771340208*x22 + 9.58859328746586*x23 + 7.86954113999846*x24 + 
# 6.49741158701661*x25;

#alternate objective function
minimize pricemin: 2.56341758415322*x1 + 4.30726249238101*x2 + 12.2362249209315*x3 + 6.4222971812068*x4 + 8.7964095733955*x5 + 6.89511491008402*x6 + 3.48768834017796*x7 + 6.58129786501228*x8 + 8.99259256911397*x9 + 11.480521292587*x10 + 9.73138761073237*x11 + 3.45068887741779*x12 + 1.97952870433526*x13 + 11.7301918137021*x14 + 9.26951261194101*x15 + 10.1596552752459*x16 + 15.6503302600074*x17 + 1.96121653043852*x18 + 9.299678394749*x19 + 3.65717936461873*x20 + 11.6717135998439*x21 + 3.04876151359263*x22 + 10.8769586933138*x23 + 10.9667347584597*x24 + 12.1365301243079*x25;

solve;

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

# display profit;
display pricemin;

end;
