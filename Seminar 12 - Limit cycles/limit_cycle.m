%% Фазовый портрет
eps = -.5;
R = 1;

[x, y] = meshgrid(linspace(-2, 2, 101));
r = sqrt(x.^2 + y.^2);
phi = linspace(0, 2*pi);

dx = y + eps*x.*(R - r);
dy = -x + eps*y.*(R - r);

figure(1);
streamslice(x, y, dx, dy)
xlabel('x');
ylabel('y');
hold on;
plot(R*cos(phi), R*sin(phi), '-r', 'LineWidth', 1.5);
hold off;
axis equal;

%% Сечение Пуанкаре
z_0 = [0, 1.02;
    0, .9;
    0, .5];
P_const = nan(size(z_0, 1), 1);
tspan = [0, 2*pi];

figure(2)
for k = 1 : size(z_0, 1)
    [t, z] = ode45(@(t, z) cycle_syst(t, z, eps, R), tspan, z_0(k, :));
    P_const(k) = z(end, 2) / z_0(k, 2);
    plot(z(:, 1), z(:, 2)); hold on;
end
plot(z_0(:, 1), z_0(:, 2), '*r');
plot(R*cos(phi), R*sin(phi), '-r', 'LineWidth', 2);
hold off;
axis equal;
axis([-2 2 -2 2]);

%% Система
function dz = cycle_syst(~, z, eps, R)
dz = zeros(2, 1);
r = sqrt(z(1)^2 + z(2)^2);

dz(1) = z(2) + eps * z(1) * (R - r);
dz(2) = -z(1) + eps * z(2) * (R - r);
end
