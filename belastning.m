clc
clear all
load eiffel1.mat
n = 261;
j = 259;
b = zeros(2*n, 1);
b(2*j - 1) = 1;
x = A\b;
xbel = xnod + x(1:2:end);
ybel = ynod + x(2:2:end);

trussplot(xnod, ynod, bars);
hold on
trussplot(xbel, ybel, bars, 'r');
hold on
plot(xnod(j), ynod(j), '*b');
hold on
plot(xbel(j), ybel(j), '*r');
