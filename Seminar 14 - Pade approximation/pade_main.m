%% Symbols
syms x
syms f(x)

%% Define function and interval
f(x) = sin(x);
xint = [-3, 3];

%% Pade approximation
R_33 = pade(f, x); % Third order by defaul
R_11 = pade(f, x, Order = [1 1]); % (a + bx) / (1 + dx)
R_12 = pade(f, x, Order = [1 2]);

%% Visualisation
figure(1)
fplot(f, xint, LineWidth = 1.5);
hold on;
fplot(R_11, xint);
fplot(R_12, xint);
fplot(R_33, xint);
hold off;

xlabel('$x$', Interpreter = 'latex', FontSize = 16)
title('Pade approximation')
legend('$\sin(x)$', '$R_{1,1}$', '$R_{1,2}$', '$R_{3,3}$', ...
    Interpreter = 'latex', FontSize = 14, Location = 'northwest')
