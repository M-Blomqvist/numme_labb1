clc
clear
%v är vektor v(1) = x, v(2) = y
ekv = @(v) [(93-v(1))^2 + (63 - v(2))^2 - 55.1^2 ; (6-v(1))^2 + (16 - v(2))^2 - 46.2^2];

%%Plot ger bra gissningar på (40;58) och (54;25)
x = [-50:0.1:150];
%Dela upp plotten i funktioner av y
topA = sqrt(55.1^2 - x.^2 +x.*186-93^2) +63 ;
botA = -sqrt(55.1^2 - x.^2 +x.*186-93^2) +63 ;
topB = sqrt(46.2^2 - x.^2+x.*12 -36) +16 ;
botB = -sqrt(46.2^2 - x.^2+x.*12 -36) +16 ;

plot(x, topA);
hold on;
plot(x, botA);
plot(x, topB);
plot(x, botB);
grid on;
%Newtons metod i flera dimensioner fungerar som vanligt men jacobianen
%Används istället för derivatan, fixpunkt.m klarar även detta
Jacobi = @(v) [-2*(93-v(1)), -2*(63 - v(2)); -2*(6-v(1)), -2*(16-v(2))];
theta = @(v) v - Jacobi(v)^(-1) * ekv(v);
guesses = [40, 54; 58, 25];
%se fixpunkt.m för detaljer
results = fixpunkt(guesses, theta, 1e-12);
plot(results(1,2), results(2,2), 'r *');
plot(results(1,1), results(2,1), 'g *');
hold off;