%% Модификации модели Мальтуса
% Рассмотрим уравнение 
%
% $$ \mathrm{d}_t x = k(x) x, $$
%
% где будем считать функцию $k(x)$ непрерывной.

%% Логистическое уравнение с постоянным отловом
% Пусть функция $k(x) = 1 - x$. Тогда получаем уравнение
%
% $$ \mathrm{d}_t x = x - x^2$$
%
% Введем постоянный отлов $c \geq 0$:
%
% $$ \mathrm{d}_t x = x - x^2 - c$$
%
% У данного уравнения
% 
% # имется две положительные стационарные точки при $c < 1/4$. Причем, 
% наибольший корень является устойчивым, а наименьший - нет;
% # имеется одна неустойчивая стационарная точка при $c = 1/4$;
% # нет стационарных точек при $c > 1/4$. Здесь, популяция истребляется за
% конечно время.

c = .23;
x_0 = logspace(-1.5, 0.8, 35);
T = 2;
tspan = [0, T];

[t, x] = ode45(@(t, x) x - x.^2 - c, tspan, x_0);

figure(2);
plot(t, x, '-k');

x_star = roots([-1 1 -c]);
for k = 1 : length(x_star)
    if isreal(x_star(k))
        line([0, T], [x_star(k), x_star(k)], ...
            'Linestyle', '--', 'Color', 'red', 'LineWidth', 1.6);
    end
end
axis([0, T, 0, min(1, max(x_0))])
tl = title('$\dot{x} = x - x^2 - c$', Interpreter = 'latex', FontSize = 14);
subtitle(['$c = ' num2str(c) '$'], 'Interpreter', 'latex');
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$x$', 'Interpreter', 'latex', 'FontSize', 14)


%% Логистическое уравнение с мягким отловом
% Введем мягкий отлов, который попорционален текущей популяции: $Q(x) =
% \theta x$. Тогда уравнение примет вид
%
% $$ \mathrm{d}_t x = (1 - \theta)x - x^2 = x(1 - \theta - x)$$
%
% У данного уравнения имеется
% 
% # неустойчивая стационарная точка $x_1^* = 0$
% # устойчивая стационарная точка $x_2^* = 1 - \theta$
%
% В стационарной точке $x_2^* = 1 - \theta$ сам отлов равен $Q(x_2^*) =
% \theta (1 - \theta)$, который достигает максимума в точке $\theta = 1/2$,
% и равен при этом $Q(0.5) = 0.25$.

theta = .5;
x_0 = logspace(-2, 0.5, 35);
T = 2;
tspan = [0, T];

[t, x] = ode45(@(t, x) (1 - theta)*x - x.^2, tspan, x_0);

figure(3);
plot(t, x, '-k');
line([0 T], [1 - theta, 1 - theta], 'Color', 'red', 'LineStyle', '--', 'LineWidth', 1.6);
line([0 T], [0, 0], 'Color', 'red', 'LineStyle', '--', 'LineWidth', 1.6);

axis([0, T, 0, min(1, max(x_0))])
tl = title('$\dot{x} = (1 - \theta)x - x^2$', Interpreter = 'latex', FontSize = 14);
subtitle(['$\theta = ' num2str(theta) '$'], 'Interpreter', 'latex');
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$x$', 'Interpreter', 'latex', 'FontSize', 14)
