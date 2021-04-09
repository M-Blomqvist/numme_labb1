clear all
clc 
n = 10;
res = zeros(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Eiffel1
load eiffel1.mat
N=size(A,1); b=randn(N,1); % Godtyckligt b

tic; 
for i = [1:n]
x=A\b; 
end
res(1) = toc;
tic;
for i = [1:n]
x=inv(A)*b;
end
res(2) = toc;

med = res/n;

fprintf("Average times for N = %d: \n\tA\\b: %4.4f ms inv(A)*b: %4.4f ms \n",N,med(1)*10^4, med(2)*10^4  );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Eiffel2
load eiffel2.mat
N=size(A,1); b=randn(N,1); % Godtyckligt b

tic; 
for i = [1:n]
x=A\b; 
end
res(1) = toc;
tic;
for i = [1:n]
x=inv(A)*b;
end
res(2) = toc;

med = res/n;

fprintf("Average times for N = %d: \n\tA\\b: %4.4f ms inv(A)*b: %4.4f ms \n",N,med(1)*10^4, med(2)*10^4  );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Eiffel3
load eiffel3.mat
N=size(A,1); b=randn(N,1); % Godtyckligt b

tic; 
for i = [1:n]
x=A\b; 
end
res(1) = toc;
tic;
for i = [1:n]
x=inv(A)*b;
end
res(2) = toc;

med = res/n;

fprintf("Average times for N = %d: \n\tA\\b: %4.4f ms inv(A)*b: %4.4f ms \n",N,med(1)*10^4, med(2)*10^4  );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Eiffel4
load eiffel4.mat
N=size(A,1); b=randn(N,1); % Godtyckligt b

tic; 
for i = [1:n]
x=A\b; 
end
res(1) = toc;
tic;
for i = [1:n]
x=inv(A)*b;
end
res(2) = toc;

med = res/n;

fprintf("Average times for N = %d: \n\tA\\b: %4.4f ms inv(A)*b: %4.4f ms \n",N,med(1)*10^4, med(2)*10^4  );
