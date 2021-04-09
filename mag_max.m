% Använd modifierad Newton för att beräkna vad den maximala magnitiseringen
% är M
clc
clear all
M = 1.05*10^4;

% Modifierad Newton där derivatans definition används för att estimera en
% derivata.
h = 1e-5;

f = @(theta) max(generator(theta, 0)) - M;
p = @(x) (h*f(x))/(f(x + h) - f(x));
% Startgissning
x = 40;
diff = 1;
prev_diff = 1000;
while abs(diff) > 0.0000001
    diff = p(x);
    if abs(diff/prev_diff) > 1
        fprintf("The function is not converging. Aborting...\n");
        break;
    end
    x = x - diff;
    fprintf("theta: %d  diff: %d \n", x, diff);
    prev_diff = diff;
end
fprintf("Solution found! theta: %d magnetisation: %d \n", x, max(generator(x, 1)));