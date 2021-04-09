
%% Kanslighet

load eiffel4.mat
N = size(A,1);
forsk=zeros(N/2,1);
A = sparse(A);

tic;
[L,U] = lu(A);
for j=1:N/2
  b = zeros(N,1); b(2*j) = -1;  % Applicera kraft i nod j
  b_t = L\b;
  x = U\b_t;          % Ber�kna f�rskjutningarna

  forsk(j) = norm(x); % Spara normen av f�rskjutningen i forsk-vektorn
end
toc

[fmax jmax] = max(forsk);  % Maximala f�rskjutningen med index
[fmin jmin] = min(forsk);  % Minimala f�rskjutningen med index

% Plotta tornet med de maximalt ('o') och
% minimalt ('*') k�nsliga noderna markerade

trussplot(xnod,ynod,bars); hold on
plot(xnod(jmax),ynod(jmax),'ro',xnod(jmin),ynod(jmin),'r*');
hold off
