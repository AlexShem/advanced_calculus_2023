%% Von Bertalanffy Growth Function

%% Problem Definition
% The equation describes the change in volume $V(t)$ over time:
%
% $$ \frac{d}{dt} V = \alpha V^{2/3} - \beta V $$
%
% where $\alpha, \beta > 0$.

%% Stationary Points
% A point $V^*$ is stationary if $\frac{d}{dt} V^* = 0$, i.e.,
%
% $$\alpha (V^*)^{2/3} - \beta V^* = 0$$
%
% Thus, the equation has two stationary points:
%
% $V_1^* = 0$ and $V_2^* = (\alpha/\beta)^3$.

%% Numerical Solution
% Define the parameters:
alpha = 1;
beta = 1;

%%
% Define initial conditions $V(0) \equiv V_0$:
V_0 = [2.2, .25, .05];

%%
% Define the time span for integration $t \in [0, T]$, $T = 10$:
T = 10;
tspan = [0, T];

%%
% Define the Von Bertalanffy growth function:
VonBertalanffy = @(t, y) alpha*y.^(2/3) - beta*y;

%%
% Numerically solve using |ode45|:
[t, V] = ode45(VonBertalanffy, tspan, V_0);
res = table(t, V, VariableNames={'t, time', 'V, paths'});
[head(res, 5); tail(res, 5)]

%% Visualization
figure(1);
plot(t, V)
hold on; % Keep the current plot

% Plot the non-zero stationary point:
stationary = (alpha/beta)^3;
line([0 T], [stationary, stationary], 'LineStyle', '--', 'Color', 'red');

% Add finishing touches:
grid on;
xlabel('$t$', 'Interpreter', "latex", 'FontSize', 14);
ylabel('$V$', 'Interpreter', "latex", 'FontSize', 14);
title('$\dot{V} = \alpha V^{2/3} - \beta V$', 'Interpreter', "latex", 'FontSize', 14);
subtitle(['$\alpha = ' num2str(alpha), ', \beta = ', num2str(beta), '$'], 'Interpreter', "latex");
legend({'$V_0 = 2.2$', '$V_0 = 0.25$', '$V_0 = 0.05$', 'Stationary Point'}, 'Location', 'northwest', 'Interpreter', "latex");

hold off; % Release the current plot
