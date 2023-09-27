function [z_root, z_path] = newton_method(f, df, z_0)

eps = 1e-6;
max_k = 50;

z_path = NaN(max_k + 1, 1);
z_path(1) = z_0;

z_path(2) = z_path(1) - f(z_path(1)) / df(z_path(1));
k = 1;

while abs(z_path(k + 1) - z_path(k)) > eps
    k = k + 1;
    if k > max_k
        error('Method did not converge');
    end
    z_path(k + 1) = z_path(k) - f(z_path(k)) / df(z_path(k));
end

z_path = z_path(~isnan(z_path));
z_root = z_path(end);
