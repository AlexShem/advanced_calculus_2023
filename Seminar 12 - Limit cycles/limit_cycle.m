%% Phase Portrait Section
% This section generates the phase portrait of the dynamical system.

% Parameters
epsilon = -0.5;
radius = 1;

% Create a grid in the x-y plane
[x, y] = meshgrid(linspace(-2, 2, 101));
radial_distance = sqrt(x.^2 + y.^2);
angle_phi = linspace(0, 2*pi);

% Define the dynamics of the system
dx = y + epsilon * x .* (radius - radial_distance);
dy = -x + epsilon * y .* (radius - radial_distance);

% Plotting the phase portrait
figure(1);
streamslice(x, y, dx, dy);
xlabel('x');
ylabel('y');
hold on;
plot(radius * cos(angle_phi), radius * sin(angle_phi), '-r', 'LineWidth', 1.5);
hold off;
axis equal;

%% Poincaré Section
% This section analyzes the system's behavior over time using Poincaré sections.

% Initial conditions
initial_conditions = [0, 1.02;
    0, 0.9;
    0, 0.5];
poincare_constants = nan(size(initial_conditions, 1), 1);
time_span = [0, 2*pi];

% Plotting for different initial conditions
figure(2)
for k = 1 : size(initial_conditions, 1)
    [t, z] = ode45(@(t, z) cycle_system(t, z, epsilon, radius), time_span, initial_conditions(k, :));
    poincare_constants(k) = z(end, 2) / initial_conditions(k, 2);
    plot(z(:, 1), z(:, 2)); hold on;
end
plot(initial_conditions(:, 1), initial_conditions(:, 2), '*r');
plot(radius * cos(angle_phi), radius * sin(angle_phi), '-r', 'LineWidth', 2);
hold off;
axis equal;
xlabel('x');
ylabel('y');
axis([-2 2 -2 2]);

%% System Dynamics Definition
% This function defines the dynamics of the system.

function dz = cycle_system(~, z, epsilon, radius)
% Calculating the rate of change of the system's state.

dz = zeros(2, 1);
radial_distance = sqrt(z(1)^2 + z(2)^2);

% Dynamics equations
dz(1) = z(2) + epsilon * z(1) * (radius - radial_distance);
dz(2) = -z(1) + epsilon * z(2) * (radius - radial_distance);
end
