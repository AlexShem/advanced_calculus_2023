# <img src="advanced_calculus_logo.png" alt="advance_calculus_logo" width="35" height="35"> Advanced Calculus 2023 Repository

# 📅 Schedule 

Weekly on Wednesdays
- **First group**: 14:40 - 16:00
    - Zoom link: https://unil.zoom.us/j/96715266118
- **Second group**: 16:20 - 17:40
    - Zoom link: https://unil.zoom.us/j/94307723831

# 📢 Announcements

* No MATLAB classes on September 13th.

# 📚 Content

## Seminar 1: _Introduction to MATLAB_

September 6th, 2023

- Contacts
- Installation of MATLAB
- Launching and configuring MATLAB
- Variables and operations on them
- Vectors and matrices
- Deleting variables
- Complex numbers
- Plotting polynomials
- Plotting arbitrary functions
- Fibonacci numbers

## Seminar 3: _Plots and Heron method_

September 20th, 2023

- Plots of functions $f(x)$ and $f(x, y)$
- Contour plots using `contour()`
- One- and two-dimensional grid methods using `linspace()` and `meshgrid()`, respectively
- Built-in methods `fplot()`, `fcontour()`
- Visualizing areas in the complex domain $\mathbb{C}$
- Heron's method of calculating the square root of a number
  - Code
  - Analysis of the method
  - Number of iterations until the method converges
  - Dependence on the initial guess $x_0$

## Seminar 4: _Newton Method and Leslie Model_

September 27th, 2023

- Coding the Newton-Raphson method
- Visualizing the domains of attraction of the method
- Eigenvalues and eigenvectors
    - Definition
    - Calculation in MATLAB using `[V, D] = eig(A)`
- Leslie model statement
- Approximation of the population size based on the largest absolute eigenvalue of the model's matrix

## Seminar 5: _Von Bertalanffy and Logistic models_

October 4th, 2023

- Dynamics of the Von Bertalanffy growth function
- Stationary points and their classification
- Numerical solution using `ode45()` function
- Logistic model analysis

## Seminar 6: _Stationary points of linear systems with constant coefficients_

October 11th, 2023

- Matrix of the linear system with constant coefficient
- Solution of the system in verctor form
- Typoes of stability (focus, centre, saddle, etc)
- Visualisation using `streamslice(x, y, dx, dy)`
- Transforming complex basis to real

## Seminar 7: _Nonlinear systems and Lotka-Volterra model_

October 18th, 2023

- Linearisation of a system in the vicinity of stationary point
    - Shift of variables
    - Taylor series
- Solving the system in Lotka-Volterra model using `ode45`
- Comparting the trjectory's ``energy'' to the corresponding isoline of the system's first integral
- Dependence of the $C$ and $L^2$ norms of the error depending on the integration time step $tau$
