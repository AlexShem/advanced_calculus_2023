# Моделирование и Симуляция Движения Маятника: Динамическое Исследование

## Введение

Добро пожаловать в увлекательное путешествие, где физика встречается с прикладной математикой! Сегодня мы погрузимся в мир осцилляций маятников. Мы будем моделировать маятник, симулировать его движение, приближать его поведение, визуализировать его фазовый портрет и многое другое.

---

## Цели

1. Создать модель маятника с использованием дифференциальных уравнений.
2. Численно решить модель, чтобы предсказать движение маятника.
3. Приблизить решение с помощью базовых тригонометрических функций.
4. Визуализировать движение маятника и его фазовый портрет.

---

## Константы и Начальные Условия

### Константы

```matlab
g = 9.81;  % Ускорение свободного падения (м/с^2)
L = 1;     % Длина маятника (м)
omega = sqrt(g/L);  % Угловая частота (рад/с)
```

### Начальные Условия

```matlab
z_0 = [0.1; 0.1];  % Начальный угол и угловая скорость
```

---

## Математическая Модель

### Исходное Уравнение

Исходное обыкновенное дифференциальное уравнение второго порядка (ОДУ), описывающее нашу систему маятника, выглядит следующим образом:

$$
\frac{d^2 \theta}{dt^2} = -\omega^2 \sin(\theta)
$$

### Приближение Малых Углов

В исходном уравнении мы часто приближаем $\sin(\theta)$ как $\theta$, когда $\theta$ мал. Это упрощение приводит к следующему:

$$
\frac{d^2 \theta}{dt^2} \approx -\omega^2 \theta
$$

Решая для $\theta(t)$, мы получаем

$$\theta(t) = c_1 \cos(\omega t) + c_2 \sin(\omega t),$$

где константы $c_1$ и $c_2$ определяются из начальных условий:

$$\theta(0) \equiv \theta_0 = c_1,$$

$$\frac{d}{d t}\theta(0) \equiv \theta_0' = c_2 \omega.$$

### Преобразование в Систему Обыкновенных Дифференциальных Уравнений Первого Порядка

Исходное уравнение второго порядка может быть преобразовано в систему из двух обыкновенных дифференциальных уравнений первого порядка следующим образом:

Пусть $z_1 = \theta$ и $z_2 = \frac{d\theta}{dt}$.

Тогда,

$$
\frac{dz_1}{dt} = z_2
$$

$$
\frac{dz_2}{dt} = -\omega^2 \sin(z_1)
$$

Вот как это реализовано в Matlab:

```matlab
function dz = pendulum_system(t, z, omega)
    dz = [z(2); -omega^2 * sin(z(1))];
end
```

### Численное Решение

Мы будем численно решать эту систему уравнений с помощью `ode45` в Matlab.

```matlab
T = 10;  % Общее время (с)
tspan = linspace(0, T, 101);  % Временной интервал
[t, z] = ode45(@(t, z) pendulum_system(t, z, omega), tspan, z_0);  % Численное Решение
```

---

## Приближенное Решение

Для приближенного уравнения решение выглядит следующим образом:

$$
\theta(t) = c_1 \cos(\omega t) + c_2 \sin(\omega t)
$$

где $c_1 = z_0(1)$ и $c_2 = \frac{z_0(2)}{\omega}$.

```matlab
c1 = z_0(1);
c2 = z_0(2)/omega;
```

---

## Визуализация Движения

### Угол vs Время

```matlab
figure(1);
comet(t, theta);
hold on;
plot(t, c1*cos(omega*t) + c2*sin(omega*t), '--k')
```

### Декартовы Координаты

```matlab
x_pos = sin(theta);
y_pos = -cos(theta);

figure(2);
for k = 1 : length(t)
    plot(L*x_pos(k), L*y_pos(k), 'ok', 'MarkerFaceColor', 'k');
    hold on;
    line([0 L*x_pos(k)], [0 L*y_pos(k)], 'Color', 'k');
    hold off;
    title(['Время = ' num2str(t(k))]);
    axis equal;
    axis([-L, L, -L, L]);
    drawnow;
end
```

---

## Фазовые Портреты

```matlab
[z_1, z_2] = meshgrid(linspace(-5*pi, 5*pi, 31), linspace(-4*pi, 4*pi, 31));
dz_1 = z_2;
dz_2 = -omega^2*sin(z_1);

figure(3);
quiver(z_1, z_2, dz_1, dz_2);
grid on;
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 16);
ylabel('$\dot{x}$', 'Interpreter', 'latex', 'FontSize', 16, 'Rotation', 0);
title('Фазовый портрет маятника');
```

---

## Заключение

Вы успешно справились с сложностями динамики маятника, используя инструменты прикладной математики. Вы численно и аналитически решили его, визуализировали движение, поняли фазовый портрет и даже изучили приближения и математические преобразования, которые делают такие анализы возможными.