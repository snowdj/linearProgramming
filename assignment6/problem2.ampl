var x1 >= 21;
var x2 >= 23;
var x3 >= 0, <= 15;
var x4 >= 0, <= 16;

maximize obj: x1 + x2 + x3 + x4;

subject to
c1: - x1 - x2 + x3 <= 11;
c2: x2 - 2 * x3 + x4 <= 9.5;
c3: x1 + x2 - x3 - 2 * x4 <= -3.5;

solve;
display x1;
display x2;
display x3;
display x4;
display obj;
end;
