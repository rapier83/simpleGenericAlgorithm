%% Simple Generic Algorithm
%% From Artifical Intelligence 2nd Edition
%% pp. 290 ~

clear;

%% Problem - : 
%%%%             For 0 < x < 15 Interger, 
%%%%             Find Maximum f(x)=(15*x - x^2) with GA
%%%% 1. Set Initial Generic

Fx = @(x) (15 .* x - x .^ 2);
InitSet = sort(int16(rand(1,6) * 15));

BinSet = dec2bin(InitSet);
Fitness = Fx(InitSet);
FitnessRate = double(Fitness) ./ sum(Fitness);

%%%% 2. Choose Gene

Roulette = sort(rand(1,6));
