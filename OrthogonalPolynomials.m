%% Part I
% Generate first six polynomials as symbolic expressions and just update
% recurrence for other polynomial families
syms x
P = sym(zeros(1,6));
P(1) = 1;
P(2) = x;
for n = 2:5
    P(n+1) = ((2*n-1)*x*P(n) - (n-1)*P(n-1))/n;
end
% Display the polynomials
for k = 1:6
    fprintf('P_%d(x) = %s\n', k-1, char(expand(P(k))));
end

%% Part II Problem 2
%Find roots for P1-P5 and display up to 16th sig fig in a table
syms x
P5 = legendreP(5, x);
rootsP5 = double(solve(P5 == 0, x));

P4 = legendreP(4, x);
rootsP4 = double(solve(P4 == 0, x));
rootsP4 = sort(rootsP4);

P3 = legendreP(3, x);
rootsP3 = double(solve(P3 == 0, x));
rootsP3 = sort(rootsP3);

P2 = legendreP(2, x);
rootsP2 = double(solve(P2 == 0, x));
rootsP2 = sort(rootsP2);

P1 = legendreP(1, x);
rootsP1 = double(solve(P1 == 0, x));
rootsP1 = sort(rootsP1);

rootsP1_str = arrayfun(@(x) sprintf('%.16g', x), rootsP1, 'UniformOutput', false);
rootsP2_str = arrayfun(@(x) sprintf('%.16g', x), rootsP2, 'UniformOutput', false);
rootsP3_str = arrayfun(@(x) sprintf('%.16g', x), rootsP3, 'UniformOutput', false);
rootsP4_str = arrayfun(@(x) sprintf('%.16g', x), rootsP4, 'UniformOutput', false);
rootsP5_str = arrayfun(@(x) sprintf('%.16g', x), rootsP5, 'UniformOutput', false);

rootsTable = table(rootsP1_str', rootsP2_str', rootsP3_str', rootsP4_str', rootsP5_str', 'VariableNames', {'P1 Roots', 'P2 Roots', 'P3 Roots', 'P4 Roots', 'P5 Roots'});
disp(rootsTable);

%% Part 2 Problem 2
%Find the corresponding Gaussian Weights
%Update n and Li for other polynomials 
syms x
n=5;
for i = 1:n
    Li = 1;
    for j = 1:n
        if j~= i
            Li = Li * ((x - rootsP5(j)) / (rootsP5(i) - rootsP5(j)));
        end
    end
    alpha_i = double(vpa(int(Li, x, -1, 1), 16));
    fprintf('Weight %d: %.16g\n', i, alpha_i);
end
disp(alpha_i)