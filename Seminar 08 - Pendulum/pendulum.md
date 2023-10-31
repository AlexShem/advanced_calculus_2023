# Modelling and Simulating Pendulum Motion: A Dynamic Exploration

## Introduction

Welcome to an intriguing journey where physics meets applied mathematics! Today, we're diving into the oscillatory world of pendulums. We'll model a pendulum, simulate its motion, approximate its behaviour, visualize its phase portrait, and much more.

---

## Objectives

1. To model a pendulum system using differential equations.
2. To numerically solve the model to predict the pendulum's motion.
3. To approximate the solution using basic trigonometric functions.
4. To visualise the pendulum's motion and its phase portrait.

---

## Constants and Initial Conditions

### Constants

```matlab
g = 9.81;  % Acceleration due to gravity (m/s^2)
L = 1;     % Length of the pendulum (m)
omega = sqrt(g/L);  % Angular frequency (rad/s)
```

### Initial Conditions

```matlab
z_0 = [0.1; 0.1];  % Initial angle and angular velocity
```

---

## The Mathematical Model

### The Original Equation

The original second-order ordinary differential equation (ODE) to describe our pendulum system is:

$$
\frac{d^2 \theta}{dt^2} = -\omega^2 \sin(\theta)
$$

### Small Angle Approximation

In the original equation, we often approximate $\sin(\theta)$ as $\theta$ when $\theta$ is small. This simplification yields:

$$
\frac{d^2 \theta}{dt^2} \approx -\omega^2 \theta
$$

Solving for $\theta(t)$ we get

$$\theta(t) = c_1 \cos(\omega t) + c_2 \sin(\omega t),$$

where constants $c_1$ and $c_2$ are determined from the initial conditions:

$$\theta(0) \equiv \theta_0 = c_1,$$

$$\frac{d}{d t}\theta(0) \equiv \theta_0' = c_2 \omega.$$

### Conversion to First-Order ODEs

The second-order ODE can be converted into a system of two first-order ODEs as follows:

Let $z_1 = \theta$ and $z_2 = \frac{d\theta}{dt}$.

Then,
$$
\frac{dz_1}{dt} = z_2
$$
$$
\frac{dz_2}{dt} = -\omega^2 \sin(z_1)
$$

Here's how this is implemented in Matlab:

```matlab
function dz = pendulum_system(t, z, omega)
    dz = [z(2); -omega^2 * sin(z(1))];
end
```

### Numerical Solution

We'll solve this system of equations numerically using Matlab's `ode45`.

```matlab
T = 10;  % Total time (s)
tspan = linspace(0, T, 101);  % Time span
[t, z] = ode45(@(t, z) pendulum_system(t, z, omega), tspan, z_0);  % Numerical Solution
```

---

## Approximate Solution

For the approximated equation, the solution is:

$$
\theta(t) = c_1 \cos(\omega t) + c_2 \sin(\omega t)
$$

where $ c_1 = z_0(1) $ and $ c_2 = \frac{z_0(2)}{\omega} $.

```matlab
c1 = z_0(1);
c2 = z_0(2)/omega;
```

---

## Visualising the Motion

### Angle vs Time

```matlab
figure(1);
comet(t, theta);
hold on;
plot(t, c1*cos(omega*t) + c2*sin(omega*t), '--k')
```

### Cartesian Coordinates

```matlab
x_pos = sin(theta);
y_pos = -cos(theta);

figure(2);
for k = 1 : length(t)
    plot(L*x_pos(k), L*y_pos(k), 'ok', 'MarkerFaceColor', 'k');
    hold on;
    line([0 L*x_pos(k)], [0 L*y_pos(k)], 'Color', 'k');
    hold off;
    title(['Time = ' num2str(t(k))]);
    axis equal;
    axis([-L, L, -L, L]);
    drawnow;
end
```

---

## Phase Portraits

```matlab
[z_1, z_2] = meshgrid(linspace(-5*pi, 5*pi, 31), linspace(-4*pi, 4*pi, 31));
dz_1 = z_2;
dz_2 = -omega^2*sin(z_1);

figure(3);
quiver(z_1, z_2, dz_1, dz_2);
grid on;
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 16);
ylabel('$\dot{x}$', 'Interpreter', 'latex', 'FontSize', 16, 'Rotation', 0);
title('Pendulum phase portrait');
```

---

## Conclusion

You've successfully navigated through the complexities of pendulum dynamics using the tools of applied mathematics. You've solved it numerically and analytically, visualised its motion, understood its phase portrait, and even delved into the approximations and mathematical transformations that make such analyses possible.
