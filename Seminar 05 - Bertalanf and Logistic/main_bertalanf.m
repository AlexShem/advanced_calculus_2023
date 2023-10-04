%% Дифференциальное уравнение фон Берталанфи

%% Постановка задачи
% Рассмотрим уравнение, которое описывает изменение объема $V(t)$ со
% временем:
% 
% $$\mathrm{d}_t V = \alpha V^{2/3} - \beta V$$
%
% где $\alpha, \beta > 0$.
%
%% Стацонарные точки
% Точка $V^*$ называется стационарной, если $\mathrm{d}_t V^* = 0$, то есть
%
% $$ \alpha (V^*)^{2/3} - \beta V^* = 0, $$
%
% Таким образом, у данного уравнения есть две стационарные точки:
%
% $$V_1^* = 0, \quad V_2^* = (\alpha/\beta)^3.$$
%
%% Численное решение уравнения фон Берталанфи
% Зададим параметры задачи

alpha = 1;
beta = 1;

%%%
% И несколько начальных положений $V(0) \equiv V_0$:
V_0 = [2.2, .25, .05];

%%%
% Далее, зададим время интегрирования $t \in [0, T]$, $T = 10$:
T = 10;
tspan = [0, T];

%%%
% Для численного интегрировании системы, восвользуемся функцией
% <https://ch.mathworks.com/help/releases/R2021b/matlab/ref/ode45.html
% ode45>.
%
% Данная функции имеет три аргумента:
% 
% # Интегрируемая функция (система) |odefun|, представимая как
% $\mathrm{d}_t y = f(t, y)$ как |function handle| или как отдельная функция 
% |function_name.m|.
% # Интервал интегрирования |tspan| в виде массива из двух элементов
% |[start end]|, или собственной сетки |linspace(0, T, 51)|.
% # Начального значения |y0| (может быть вектором).
% 

[t, V] = ode45(@(t, y) alpha*y.^(2/3) - beta*y, tspan, V_0);
res = table(t, V, VariableNames={'t, time', 'V, paths'});
[head(res, 5); tail(res, 5)]

%% Визуализация
figure(1);
plot(t, V)

%%%
% Отобразим ненулевую стационарную точку
line([0 T], [(alpha/beta)^3, (alpha/beta)^3], 'LineStyle', '--', 'Color', 'red');

%%%
% Финальные штрихи
grid on;
xlabel('$t$', Interpreter = "latex", FontSize = 14);
ylabel('$V$', Interpreter = "latex", FontSize = 14);
tl = title('$\dot{V} = \alpha V^{2/3} - \beta V$', Interpreter = "latex");
tl.FontSize = 14;
subtitle(['$\alpha = ' num2str(alpha), ', \beta = ', num2str(beta), '$'], Interpreter = "latex");
