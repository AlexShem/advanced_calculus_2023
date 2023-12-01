# Ошибка интерполяции кубическим сплайном

## 📚 Общие сведения

Интерполяция кубическим сплайном является передовой техникой, используемой в численных методах для создания плавных кривых, проходящих через заданный набор точек. В отличие от полиномиальной интерполяции, она избегает проблемы явления Рунге за счет использования кусочно-полиномиальных функций. Этот метод очень эффективен для интерполяции сложных функций, которые трудно вычислить напрямую.

## 🎯 Цели

1. **Понимание стабильности сплайна**: Исследование стабильности интерполяции кубическим сплайном и влияния выбора узлов на ошибку интерполяции.
2. **Реализация в MATLAB**: Использование MATLAB для интерполяции функции Рунге с помощью кубических сплайнов и анализ полученных результатов.
3. **Визуализация ошибок**: Построение графика ошибки интерполяции и сравнение ее с встроенной в MATLAB функцией `spline` для узлов, расположенных равномерно и по Чебышеву.
4. **Сравнение ошибок**: Оценка точности пользовательской интерполяции сплайном по сравнению с функцией `spline` в MATLAB.

## 📝 Исходная постановка задачи

- **Шаг 1: Понимание предоставленной функции.** Изучите предоставленные функции MATLAB `hermite_interp` и `spline_custom`, и поймите их реализацию.
- **Шаг 2: Интерполяция функции Рунге.** Используйте функцию Рунге `f = @(x) 1./(1 + 25*x.^2)` для генерации истинных значений функции. Интерполируйте эти значения с помощью пользовательских функций кубического сплайна.
- **Шаг 3: Расчет и визуализация ошибок.** Вычислите ошибку интерполяции, используя равномерное `x_uniform = linspace(-2, 2, N)` и чебышевское `x_chebyshev = cos(pi*(k + .5)/N)`, где `k = 0:(N-1)`, на отрезке $x\in[−2,2]$. Используйте плотную сетку `x_fine = linspace(-2, 2, 1001)` для сравнения интерполированных значений с истинными значениями функции. Ошибка должна быть рассчитана как абсолютное различие между интерполированными и истинными значениями.
- **Шаг 4: Сравнение со сплайном MATLAB.** Выполните ту же интерполяцию с использованием встроенной функции `spline` MATLAB и сравните результаты.
- **Шаг 5: Графический анализ ошибок.** Постройте графики ошибок от пользовательского сплайна и сплайна MATLAB для различных `N = 5:10:45`, используя подграфики или наложенные графики для непосредственного сравнения.
- **Шаг 6: Выводы.** Обсудите производительность пользовательской интерполяции сплайном по сравнению со сплайном MATLAB, сосредоточив внимание на величине ошибки и стабильности при различных распределениях узлов.

## 📊 Ожидаемые результаты

- Графики, сравнивающие ошибку интерполяции между пользовательским сплайном и сплайном MATLAB для каждого `N`.
- Анализ влияния распределения узлов (равномерное vs. Чебышевское) на точность интерполяции.

## Реализация кода

### hermite_interp.m

```matlab
function P = hermite_interp(x, a, b, vals)
%HERMITE_INTERP Performs cubic Hermite interpolation.
%   P = HERMITE_INTERP(X, A, B, VALS) returns the interpolated values P
%   at points X using cubic Hermite interpolation between points A and B.
%   VALS is a vector containing the function values and derivatives at A
%   and B: [f(A), f'(A), f(B), f'(B)].

% Validate inputs
validateattributes(x, {'numeric'}, {'vector'}, mfilename, 'x', 1);
validateattributes(a, {'numeric'}, {'scalar'}, mfilename, 'a', 2);
validateattributes(b, {'numeric'}, {'scalar'}, mfilename, 'b', 3);
validateattributes(vals, {'numeric'}, {'vector', 'numel', 4}, mfilename, 'vals', 4);

% Hermite interpolation coefficients
h = b - a;
[ca, da, cb, db] = compute_coeffs(h, vals);

% Hermite interpolation polynomial
P = ca * (x - a) .* (x - b).^2 + da * (x - b).^2 + ...
    cb * (x - a).^2 .* (x - b) + db * (x - a).^2;
end

function [ca, da, cb, db] = compute_coeffs(h, vals)
% Compute the Hermite interpolation coefficients.
Pa = vals(1);
dPa = vals(2);
Pb = vals(3);
dPb = vals(4);

ca = (dPa * h + 2 * Pa) / h^3;
da = Pa / h^2;
cb = (dPb * h - 2 * Pb) / h^3;
db = Pb / h^2;
end
```

### spline_custom.m

```matlab
function S = spline_custom(x_val, y_val, x)
%SPLINE_CUSTOM Custom implementation of cubic spline interpolation.
%   S = SPLINE_CUSTOM(X_VAL, Y_VAL, X) performs cubic spline interpolation
%   on the given data points X_VAL and Y_VAL, and evaluates the spline at
%   points X. X_VAL should be a vector of unique, sorted values, and Y_VAL
%   contains the corresponding function values. Optionally, Y_VAL can also
%   include first derivatives at the start and end points.

% Validate inputs
validateattributes(x_val, {'numeric'}, {'vector', 'increasing'}, mfilename, 'x_val', 1);
validateattributes(y_val, {'numeric'}, {'vector'}, mfilename, 'y_val', 2);
validateattributes(x, {'numeric'}, {'vector'}, mfilename, 'x', 3);

x_val = x_val(:);
y_val = y_val(:);
x = x(:);

% Determine spline coefficients
N = length(x_val) - 1;
h = diff(x_val);
lam = h(2:end) ./ (h(1:end-1) + h(2:end));
mu = 1 - lam;

% Border conditions
dy_left = 0;
dy_right = 0;
if length(y_val) == length(x_val) + 2
    dy_left = y_val(1);
    dy_right = y_val(end);
    y_val = y_val(2:end-1);
end

% Construct tridiagonal system
C = compute_rhs(y_val, h, lam, mu);
A = construct_tridiagonal(N, lam, mu);
C = [dy_left; C; dy_right];

% Solve for spline coefficients
m = A \ C;

% Evaluate spline
S = evaluate_spline(x, x_val, y_val, m, N);
end

function C = compute_rhs(y_val, h, lam, mu)
% Compute the right-hand side of the tridiagonal system.
C = 3 * lam .* (y_val(2:end-1) - y_val(1:end-2)) ./ h(1:end-1) + ...
    3 * mu .* (y_val(3:end) - y_val(2:end-1)) ./ h(2:end);
end

function A = construct_tridiagonal(N, lam, mu)
% Construct the tridiagonal matrix for the spline system.
A = 2 * eye(N + 1) + diag([0; mu] .* ones(N, 1), 1) + ...
    diag([lam; 0] .* ones(N, 1), -1);
A(1, 2) = 0;
A(end, end-1) = 0;
end

function S = evaluate_spline(x, x_val, y_val, m, N)
% Evaluate the spline at points X.
S = zeros(size(x));
for k = 1 : N
    if k == N
        range = x >= x_val(k) & x <= x_val(k + 1);
    else
        range = x >= x_val(k) & x < x_val(k + 1);
    end
    S(range) = hermite_interp(x(range), x_val(k), x_val(k + 1), ...
        [y_val(k), m(k), y_val(k + 1), m(k + 1)]);
end
end
```
