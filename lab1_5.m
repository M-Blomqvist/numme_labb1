%Labb 1 Uppgit 5
%a) C*[x1;x2..;xk] = testdata(:,1) k=50 okända, 256 ekvationer 1x256 ut
clc
clear
load minidigits;
%PA = LU faktorisera för snabbare berkäningar
[L,U] = lu(C);
samples = size(testdata,2);
for i = 1:samples
  b = testdata(:,i);  %Högerled
  b_ = L\b;
  x = U\b_;
  nv(i) = norm(C*x-testdata(:,i));
end

p = (mean(nv)+min(nv))/2;
correct_twos = 0;
false_positives = 0;
false_negatives = 0;
for i = 1:size(nv,2)
  if nv(i) < p
    if testdatad(i) == 2
      correct_twos = correct_twos + 1;
    else
      false_positives = false_positives + 1;
    end
  elseif testdatad(i) == 2
    false_negatives = false_negatives + 1;
  end
end
fprintf('For Twos: \n')
fprintf('correct twos: %d%% \n', 100*correct_twos/(correct_twos+false_negatives));
fprintf('false negatives: %d%%\n', 100*false_negatives/(false_negatives+correct_twos));
fprintf('For all numbers: \n')
fprintf('false positives: %d%% \n', 100*false_positives/size(testdata,2));