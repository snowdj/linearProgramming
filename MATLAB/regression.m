%% Programming Assignment Part III
%% Kelly Kaoudis
%% CSCI 5654, Fall 2013

function regression(m)

x = linspace(1,m);
idx = [1:m];

%% first collect a bunch of data from the Part II solver instance
lg = [];
plot_lg_fit = [];

bland = [];
plot_bland_fit = [];

%% m = n so that inner matrix dimensions agree for pivoting
%% collect x timing instances on random, dense problems of size from 1 to x for each entering rule
for i = 1:m
   [lg(i), bland(i)] = testEnteringRules( i,i )   
end

%% construct a polynomial fit of degree using least squares to explain the runtime in terms of problem size m,n
lg_fit = polyfit(idx, lg, 3)
bland_fit = polyfit(idx, bland, 3)

lg_curve = polyval(lg_fit, x);
bland_curve = polyval(bland_fit, x);

%% plot our data and regression curve-fitting results
plot(lg, 'ro')
hold on 

plot(bland, 'bo')
hold on

plot(x, lg_curve, 'r')
hold on

plot(x, bland_curve, 'b')
hold on

axis([1 m min(lg) max(bland)])

xlabel('Problem size m = n (m,n)');
ylabel('Runtime');

legend('timings for largest coefficient', 'timings for bland', 'largest coefficient fit', 'bland fit', 'Location', 'NorthWest');

hold off

end