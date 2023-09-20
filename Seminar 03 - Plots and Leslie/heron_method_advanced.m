function [a_root, iter, x] = heron_method_advanced(a, x_0)
% This function, in contrast to heron_method.m, does not require the second
% input arguemnt x_0.
% If x_0 is not supplied, the heuristic approximation is used, see
if nargin < 2
    n = floor(log10(abs(a)));
    if mod(n, 2) == 0
        x_0 = 2 * 10^(n/2);
    else
        x_0 = 2 * 10^((n - 1)/2);
    end
end

eps = 1e-6;
iter_max = 100;
x = NaN(iter_max + 1, 1);
x(1) = x_0;

iter = 1; % Iteration 1 is done
x(iter + 1) = .5*(x(iter) + a/x(iter));

while abs(x(iter + 1) - x(iter)) > eps
    iter = iter + 1;
    if iter > iter_max
        error('Method did not converge');
    end
    x(iter + 1) = .5*(x(iter) + a/x(iter));
end

a_root = x(iter + 1);
x = x(~isnan(x));
end
