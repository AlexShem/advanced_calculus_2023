# Modelling and Simulating Pendulum Motion: A Dynamic Exploration

## Introduction

Welcome to an intriguing journey where physics meets applied mathematics! Today, we are going to delve deep into the oscillatory world of pendulums. We will not only simulate a pendulum's motion but also approximate its behaviour, visualize its phase portrait, and much more.

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

Here, we assume a simple pendulum system with a length `L` of 1 metre and account for Earth's gravity, `g`, at \(9.81 \, \text{m/s}^2\).

### Initial Conditions

```matlab
z_0 = [0.1; 0.1];  % Initial angle and angular velocity
```

We consider a near-equilibrium initial condition with a slight initial displacement and angular velocity.

---

## The Mathematical Model

We use the second-order ordinary differential equation (ODE) to describe our pendulum system:

\[
\frac{d^2 \theta}{dt^2} = -\omega^2 \sin(\theta)
\]

We'll solve this equation numerically using Matlab's `ode45`.

```matlab
T = 10;  % Total time (s)
tspan = linspace(0, T, 101);  % Time span
[t, z] = ode45(@(t, z) pendulum_system(t, z, omega), tspan, z_0);  % Numerical Solution
```

---

## Approximate Solution

We also consider an approximate solution given by:

\[
\theta(t) = c_1 \cos(\omega t) + c_2 \sin(\omega t)
\]

where \( c_1 = z_0(1) \) and \( c_2 = \frac{z_0(2)}{\omega} \).

```matlab
c1 = z_0(1);
c2 = z_0(2)/omega;
```

---

## Visualising the Motion

### Angle vs Time

We use a comet plot to visualise how the angle changes over time and overlay the approximate solution.

```matlab
figure(1);
comet(t, theta);
hold on;
plot(t, c1*cos(omega*t) + c2*sin(omega*t), '--k')
```

### Cartesian Coordinates

We plot the real-time motion of the pendulum by converting the angle to Cartesian coordinates.

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

We plot the phase portrait to explore the dynamical system's behaviour further.

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

Congratulations! You have successfully explored a pendulum system's dynamics using applied mathematics tools. We solved it both numerically and analytically, visualised its motion, and even understood its phase portrait. This report provides a hands-on approach to understanding complex systems, reinforcing the power and elegance of applied mathematics.
