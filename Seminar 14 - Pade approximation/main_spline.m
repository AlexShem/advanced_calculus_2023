%%
N = 5;
a = 0;
b = pi;

% xval = linspace(0, pi, N+1);
% rng(1);
xval = [a, sort(unifrnd(a, b, 1, N-1)), b];
yval = sin(xval);
x = linspace(a, b, 3001);

%% Spline
S = spline_custom(xval, [1, yval, -1], x);

%% Visualisation
figure(1);
scatter(xval, yval, 'fill');
hold on;
plot(x, S);
hold off;

%% Spline MATLAB
% S_m = spline(xval, [1, yval, -1], x);
S_m = spline(xval, yval, x);
figure(1);
hold on;
plot(x, S_m, ':k');
hold off;
legend('Data', 'Custom Spline', 'Matlab Spline', 'FontSize', 14)
