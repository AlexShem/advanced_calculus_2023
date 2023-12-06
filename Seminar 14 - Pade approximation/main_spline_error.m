%% Initialization of the parameters
a = 0;
b = pi;
L = b - a;
N_range = 1 : 100;
h_range = L./N_range;

x = linspace(a, b, 301);
h = x(2) - x(1);

f_fun = @sin;
f = f_fun(x);

%% Error compared to the true solution
C_norm = zeros(length(N_range), 1);
L2_norm = zeros(length(N_range), 1);

for n = N_range
    xval = linspace(0, pi, n+1);
    yval = f_fun(xval);
    S = spline_custom(xval, [1, yval, -1], x);
    
    C_norm(n) = max(abs(S - f));
    L2_norm(n) = sqrt(h*sum((S - f).^2));
end

figure(1);
loglog(h_range, C_norm);
hold on;
loglog(h_range, L2_norm);
hold off;
xlabel('h');
legend('C norm', 'L^2 norm', 'Location', 'northwest', 'FontSize', 12)
