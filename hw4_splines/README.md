# Cubic Spline Interpolation Error

## 📚 Background

Cubic spline interpolation is a sophisticated technique used in numerical methods to create smooth curves passing through a set of points. Unlike polynomial interpolation, it avoids the problem of Runge's phenomenon by using piecewise polynomials. This method is highly effective for interpolating complex functions that are challenging to compute directly.

## 🎯 Objectives

1. **Comprehending Spline Stability**: Examine the stability of cubic spline interpolation and the impact of node selection on interpolation error.
2. **MATLAB Implementation**: Use MATLAB to interpolate the Runge's function using cubic splines and analyze the results.
3. **Error Visualization**: Plot the interpolation error and compare it with MATLAB's built-in `spline` function for both uniform and Chebyshev nodes.
4. **Error Comparison**: Evaluate the accuracy of the custom spline interpolation against the MATLAB's spline function.

## 📝 Problem Statement

- **Step 1: Understand the Provided Function.** Review the provided MATLAB functions [`hermite_interp`](https://github.com/AlexShem/advanced_calculus_2023/blob/main/hw4_splines/hermite_interp.m) and [`spline_custom`](https://github.com/AlexShem/advanced_calculus_2023/blob/main/hw4_splines/spline_custom.m), and understand their implementation.
- **Step 2: Interpolating Runge's Function.** Use the Runge's function `f = @(x) k*sin(m*x)./(1 + 25*x.^2)` for generating true function values. Interpolate these values using the custom cubic spline functions.
- **Step 3: Compute and Visualize Errors.** Calculate the interpolation error using both uniform `x_uniform = linspace(-2, 2, N)` and Chebyshev `x_chebyshev = cos(pi*(t + .5)/N)`, where `t = 0:(N-1)`, on the segment $x\in[−2,2]$. Use a fine grid `x_fine = linspace(-2, 2, 1001)` to compare the interpolated values against the true function values. The error should be computed as the absolute difference between the interpolated and true values.
- **Step 4: Compare with MATLAB's Spline.** Perform the same interpolation using MATLAB's built-in [`spline`](https://ch.mathworks.com/help/matlab/ref/spline.html) function and compare the results.
- **Step 5: Graphical Error Analysis.** Plot the errors from the custom spline and MATLAB's spline for different `N = 5:10:45`, using subplots or overlaying graphs for direct comparison.
- **Step 6: Conclusions.** Discuss the performance of the custom spline interpolation relative to MATLAB's spline, focusing on error magnitude and stability across different node distributions.

## 📊 Expected Outputs

- Plots comparing the interpolation error between the custom spline and MATLAB's spline for each `N`.
- Analysis of how the node distribution (uniform vs. Chebyshev) affects the interpolation accuracy.

## Code Implementation

### hermite_interp.m

```matlab
function P = hermite_interp(x, a, b, vals)
%HERMITE_INTERP Performs cubic Hermite interpolation.
%   P = HERMITE_INTERP(X, A, B, VALS) returns the interpolated values P
%   at points X using cubic Hermite interpolation between points A and B.
%   VALS is a vector containing the function values and derivatives at A
%   and B: [f(A), f'(A), f(B), f'(B)].

% Validate inputs
validateattributes(x, {'numeric'}, {'vector'}, mfilename, 'x', 1);
validateattributes(a, {'numeric'}, {'scalar'}, mfilename, 'a', 2);
validateattributes(b, {'numeric'}, {'scalar'}, mfilename, 'b', 3);
validateattributes(vals, {'numeric'}, {'vector', 'numel', 4}, mfilename, 'vals', 4);

% Hermite interpolation coefficients
h = b - a;
[ca, da, cb, db] = compute_coeffs(h, vals);

% Hermite interpolation polynomial
P = ca * (x - a) .* (x - b).^2 + da * (x - b).^2 + ...
    cb * (x - a).^2 .* (x - b) + db * (x - a).^2;
end

function [ca, da, cb, db] = compute_coeffs(h, vals)
% Compute the Hermite interpolation coefficients.
Pa = vals(1);
dPa = vals(2);
Pb = vals(3);
dPb = vals(4);

ca = (dPa * h + 2 * Pa) / h^3;
da = Pa / h^2;
cb = (dPb * h - 2 * Pb) / h^3;
db = Pb / h^2;
end
```

### spline_custom.m

```matlab
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
```
