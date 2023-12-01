function S = spline_custom(x_val, y_val, x)
%SPLINE_CUSTOM Custom implementation of cubic spline interpolation.
%   S = SPLINE_CUSTOM(X_VAL, Y_VAL, X) performs cubic spline interpolation
%   on the given data points X_VAL and Y_VAL, and evaluates the spline at
%   points X. X_VAL should be a vector of unique, sorted values, and Y_VAL
%   contains the corresponding function values. Optionally, Y_VAL can also
%   include first derivatives at the start and end points.

% Validate inputs
validateattributes(x_val, {'numeric'}, {'vector', 'increasing'}, mfilename, 'x_val', 1);
validateattributes(y_val, {'numeric'}, {'vector'}, mfilename, 'y_val', 2);
validateattributes(x, {'numeric'}, {'vector'}, mfilename, 'x', 3);

x_val = x_val(:);
y_val = y_val(:);
x = x(:);

% Determine spline coefficients
N = length(x_val) - 1;
h = diff(x_val);
lam = h(2:end) ./ (h(1:end-1) + h(2:end));
mu = 1 - lam;

% Border conditions
dy_left = 0;
dy_right = 0;
if length(y_val) == length(x_val) + 2
    dy_left = y_val(1);
    dy_right = y_val(end);
    y_val = y_val(2:end-1);
end

% Construct tridiagonal system
C = compute_rhs(y_val, h, lam, mu);
A = construct_tridiagonal(N, lam, mu);
C = [dy_left; C; dy_right];

% Solve for spline coefficients
m = A \ C;

% Evaluate spline
S = evaluate_spline(x, x_val, y_val, m, N);
end

function C = compute_rhs(y_val, h, lam, mu)
% Compute the right-hand side of the tridiagonal system.
C = 3 * lam .* (y_val(2:end-1) - y_val(1:end-2)) ./ h(1:end-1) + ...
    3 * mu .* (y_val(3:end) - y_val(2:end-1)) ./ h(2:end);
end

function A = construct_tridiagonal(N, lam, mu)
% Construct the tridiagonal matrix for the spline system.
A = 2 * eye(N + 1) + diag([0; mu] .* ones(N, 1), 1) + ...
    diag([lam; 0] .* ones(N, 1), -1);
A(1, 2) = 0;
A(end, end-1) = 0;
end

function S = evaluate_spline(x, x_val, y_val, m, N)
% Evaluate the spline at points X.
S = zeros(size(x));
for k = 1 : N
    if k == N
        range = x >= x_val(k) & x <= x_val(k + 1);
    else
        range = x >= x_val(k) & x < x_val(k + 1);
    end
    S(range) = hermite_interp(x(range), x_val(k), x_val(k + 1), ...
        [y_val(k), m(k), y_val(k + 1), m(k + 1)]);
end
end
