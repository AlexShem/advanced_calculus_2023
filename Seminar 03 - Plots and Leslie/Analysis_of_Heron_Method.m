%% Метод Герона

%% Описание метода Герона
% Пусть задано вещественное число $a > 0$, и необходимо найти его квадратный корень, то есть
% такое число $x$, что $x^2 = a$.
% 
% Для этого, зададим начальное приближение $x_0 > 0$, и будем итерационно считать
% 
% $$x_{n} = \frac{1}{2} \left(x_{n-1} + \frac{a}{x_{n-1}}\right), \quad n = 1, 2,\ldots$$
% 

%% Постановка задачи
% Для заданного вещественного числа $a > 0$ провести анализ:
% 
% # последовательности $x_n$ в зависимости от $n$ для различных начальных
% условий $x_0$;
% # зависимости количества итераций метода Герона от начального условия $x_0$.
% 

%% Реализация метода Герона
% 
% <include>heron_method.m</include>
% 
%%%
% Посчитаем квадратный корень из $a = 300$ методом Герона:

a = 300;
x = heron_method(a, 10)

%%%
% Разница между посчитанным числом |x| и точным значением |sqrt(a)| есть
abs(x - sqrt(a))

%% Случайные начальные условия
% Зададим количество |nsim| начальных условий, для каждого из которых
% запустим метод Герона |heron_method()|.
nsim = 100;

%%%
% Также, зададим верхнюю границу |x_upper|, выше которой начальные условия
% браться не будут:
x_upper = a/3;

%%%
% Вообще, можно было бы разбить полуинтервал $x \in (0, \mathrm{x\_upper}]$
% равномерно. Например, следующим образом
% 
%   x_0 = linspace(1e-4, x_upper, nsim);
%
% но в этот раз мы разберем генерацию случайных чисел в MATLAB(R).

%%%
% Зададим "seed" для генерации псевдослучайных величин, чтобы при повторном
% запуске кода генерировались одни и те же "случайные" величины.
rng(54);

%%%
% Теперь создадим |nsim| равномерно распределенных случайных величин на
% интервале $(0, \mathrm{x\_upper})$, см. 
% <https://ch.mathworks.com/help/releases/R2021b/stats/unifrnd.html unifrnd>, 
% и отсортируем их. Это и будут наши начальные приближения для метода Герона.
x_0 = unifrnd(0, x_upper, nsim, 1);
x_0 = sort(x_0);

%%%
% Также зададим количество последовательностей $x_n$, которое мы будем рисовать
% для задачи (1)
nplot = 8;

%%%
% и выберем |nplot| случайных индексов от |1| до |nsim|, см. справку
% <https://ch.mathworks.com/help/releases/R2021b/matlab/ref/randperm.html randperm>.
ind_draw = randperm(nsim, nplot)

%% Траектории некоторых последовательностей
% Создадим вектор-столбец |iter_num| размера |nsim|, в который будем записывать
% количество итераций метода Герона в зависимости от различных начальных
% условий.
iter_num = zeros(nsim, 1);

%%%
% Для каждого начального условия из вектора |x_0| запустим |heron_method|.
figure(2);
for k = 1 : nsim
   [~, iter_num(k), x_path] = heron_method(a, x_0(k));
   
   % Если индекс k принадлежит множеству индексов ind_draw, то рисуем данную траекторию
   if ismember(k, ind_draw)
       plot(0:iter_num(k), x_path, '-s');
       hold on;
   end
end
hold off;
xlabel('No. of interation');
ylabel('x_0');
%%% 
% Нарисуем горизонтальную пунктирную линию красным цветов, толщиной 2 (по
% умолчанию все линии рисуются с толщиной 1, см. справку 
% <https://ch.mathworks.com/help/releases/R2021b/matlab/ref/line.html line>),
% которая отобразит точное значение корня $\sqrt{a}$.
line([0, max(iter_num(ind_draw))], [sqrt(a), sqrt(a)],...
    'color', 'red', 'LineWidth', 2, 'LineStyle', '--');

%% Количество итераций алгоритма в зависимости от начального приближения
% Здесь, как и ранее, красная пунктирная линия отмечает точное значение
% величины $\sqrt{a}$. Обратим внимание на то, что если начальное
% приближение $x_0$ выбрано уже достаточно близко к точному, то требутся всего
% несколько итерация алгортма чтобы он сошелся. Чем дальше (или "хуже") мы
% подобрали начальное приближение, тем дольше работает метод.
figure(3);
plot(x_0, iter_num, '-')
xlim([0, x_upper]);         % Пределы оси Ox: от 0 до верхней границы x_upper
ylim([0, max(iter_num)]);   % Пределы оси Oy: от 0 до максимльного числа итераций
xlabel('x_0');
ylabel('Number of iterations');
line([sqrt(a), sqrt(a)], [0 max(iter_num)],...
    'Color', 'red', 'LineWidth', 2, 'LineStyle', '--');
