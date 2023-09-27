function [z_root, z_path] = newton_method_gpt(f, df, z_0, eps, max_k)
% NEWTON_METHOD Finds the root of a function using the Newton-Raphson method.
%   [z_root, z_path] = NEWTON_METHOD(f, df, z_0) finds the root of the function
%   represented by the function handle f, with its derivative represented by
%   the function handle df, starting from the initial guess z_0. The function
%   returns the estimated root z_root and the path of estimates z_path.
%
%   [...] = NEWTON_METHOD(f, df, z_0, eps, max_k) additionally specifies the
%   tolerance eps and the maximum number of iterations max_k.

% Validate input parameters
if ~isa(f, 'function_handle') || ~isa(df, 'function_handle')
    error('f and df must be valid function handles');
end
if ~isnumeric(z_0)
    error('z_0 must be a numeric value');
end

% Set default values for optional parameters
if nargin < 4
    eps = 1e-6; % Tolerance for convergence
end
if nargin < 5
    max_k = 50; % Maximum number of iterations
end

% Initialize the path of estimates with preallocation
z_path = NaN(max_k + 1, 1);
z_path(1) = z_0;

% Main loop of the Newton-Raphson method
k = 1;
while true
    % Compute the next estimate
    z_next = z_path(k) - f(z_path(k)) / df(z_path(k));
    z_path(k + 1) = z_next;
    
    % Check for convergence or maximum iterations
    if abs(z_next - z_path(k)) < eps
        break;
    elseif k >= max_k
        error('Method did not converge');
    end
    
    k = k + 1;
end

% Remove unused preallocated elements
z_path = z_path(~isnan(z_path));

% Return the estimated root
z_root = z_path(end);

