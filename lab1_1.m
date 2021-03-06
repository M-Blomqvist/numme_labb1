clc
clear
f = @(x) x.^2-3*sin(x.*3+2)-1;
% a) rita grafen inklusive alla nollpunkter
xs = [-3.0: .1: 4.0];
ys = f(xs);
plot(xs,ys);
grid on
hold on

%b) Använd given fixpunkt function för och visa vilka nollställen
% den kan finna, empiriskt & teoretiskt
theta = @(x) (1/9)*(x.^2-3*sin((x.*3)+2)-1)+x;
guess = [-0.75, 0.4, 1.6, 2];
%se fixpunkt.m för hela funktionen
found_roots = fixpunkt(guess, theta, 1e-10);
f_roots = f(found_roots);
plot(found_roots, f_roots, 'r *');

%Även med andra gissningar kring x ~=0.5 x~=2 så missas de rötterna
guess = [0.55,1.9];
%se fixpunkt.m för hela funktionen
found_roots = fixpunkt(guess, theta, 1e-10);
f_roots = f(found_roots);
plot(found_roots, f_roots, 'r *');

%Med rötterna till funktionen hittade i c) kan vi bevisa att theta
%omöjligen konvergerar till de två missade rötterna
%thetas derivata
theta_d = @(x) x.*(2/9)-cos((x.*3)+2)+1;
roots = [-0.720353075847192,0.468286405224616,1.617302479860036,1.993885987467251];
for i = 1:size(roots,2)
    r = roots(i);
    theta_d_r = theta_d(r)
    if theta_d_r > 1
        fprintf('Cannot use theta to find root %d', r);
    end
end

%Bestäm den största och den minsta roten till ekvationen med Newtons metod.
fprintf('\n Newton! \n');
guess = [-0.75, 0.5, 1.6, 2];
% Theta funkitonens derivata för Newton
f_d = @(x) x.*2- 9*cos(x.*3+2);
newton = @(x) x - f(x)/f_d(x);

newton_roots = fixpunkt(guess, newton, 1e-10);
f_newton = f(newton_roots);
%Här hittas dock alla rötter
plot(newton_roots, f_newton, 'black .')
hold off