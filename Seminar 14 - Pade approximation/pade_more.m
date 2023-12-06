%% Padé Approximation Examples

%% Symbols
syms x
syms f(x)

%% Example 1: Sine Function
f1(x) = sin(x);
xint1 = [-3, 3];

% Padé approximation for sine function
R12_sine = pade(f1, x, Order = [1 2]);

% Visualisation for sine function
figure(1)
fplot(f1, xint1, LineWidth = 1.5);
hold on;
fplot(R12_sine, xint1);
hold off;

xlabel('$x$', Interpreter = 'latex', FontSize = 16)
title('Padé Approximation for $\sin(x)$', Interpreter = 'latex')
legend('$\sin(x)$', '$R_{1,1}$', Interpreter = 'latex', FontSize = 14, Location = 'northwest')

%% Example 2: Function with a Singularity
f2(x) = log(x);
xint2 = [0.1, 2];

% Padé approximation for logarithm
R22_log = pade(f2, x, 1, Order = [2 2]);

% Visualisation for logarithm
figure(2)
fplot(f2, xint2, LineWidth = 1.5);
hold on;
fplot(R22_log, xint2);
hold off;

xlabel('$x$', Interpreter = 'latex', FontSize = 16)
title('Padé Approximation for $\ln(x)$', Interpreter = 'latex')
legend('$\ln(x)$', '$R_{1,1}$', Interpreter = 'latex', FontSize = 14, Location = 'northwest')

%% Example 3: Rapidly Oscillating Function
f3(x) = exp(-x^2) * cos(10*x);
xint3 = [-2, 2];

% Padé approximation for the oscillating function
R55_osc = pade(f3, x, Order = [5 5]);

% Visualisation for the oscillating function
figure(3)
fplot(f3, xint3, LineWidth = 1.5);
hold on;
fplot(R55_osc, xint3);
hold off;

xlabel('$x$', Interpreter = 'latex', FontSize = 16)
title('Padé Approximation for $e^{-x^2}\cos(10x)$', Interpreter = 'latex')
legend('$e^{-x^2}\cos(10x)$', '$R_{1,1}$', Interpreter = 'latex', FontSize = 14, Location = 'northwest')
