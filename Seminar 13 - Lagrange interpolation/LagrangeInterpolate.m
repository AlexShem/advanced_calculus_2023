function y = LagrangeInterpolate(x_val, y_val, x)
% Validate Inputs
if isempty(x_val) || isempty(y_val) || isempty(x)
    error('Input arrays x_val, y_val, and x must be non-empty.');
end
if ~isnumeric(x_val) || ~isnumeric(y_val) || ~isnumeric(x)
    error('All inputs must be numeric arrays.');
end
if length(x_val) ~= length(y_val)
    error('Arrays x_val and y_val must be of the same length.');
end
if length(unique(x_val)) < length(x_val)
    error('Elements in x_val must be unique.');
end

% Reshape inputs to column vectors
x_val = x_val(:).';
y_val = y_val(:).';
x = x(:);

% Lagrange Interpolation
n = length(x_val);
L = zeros(length(x), n);
for i = 1:n
    L(:, i) = prod((x - x_val(1:n ~= i)) ./ (x_val(i) - x_val(1:n ~= i)), 2);
end
y = L * y_val.';
end
