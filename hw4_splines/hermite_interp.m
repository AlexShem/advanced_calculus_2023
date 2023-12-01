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
