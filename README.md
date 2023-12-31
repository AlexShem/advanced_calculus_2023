# <img src="advanced_calculus_logo.png" alt="advance_calculus_logo" width="35" height="35"> Advanced Calculus 2023 Repository

# 📅 Schedule 

Weekly on Wednesdays
- **First group**: 14:40 - 16:00
    - Zoom link: https://unil.zoom.us/j/96715266118
- **Second group**: 16:20 - 17:40
    - Zoom link: https://unil.zoom.us/j/94307723831

# 📢 Announcements

* No MATLAB classes on September 13th.
* No MATLAB classes on November 15th.

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

## Seminar 6: _Stationary Points of Linear Systems with Constant Coefficients_

October 11th, 2023

- Matrix of the linear system with constant coefficients
- Solution of the system in vector form
- Types of stability (focus, centre, saddle, etc.)
- Visualisation using `streamslice(x, y, dx, dy)`
- Transforming complex basis to real

## Seminar 7: _Nonlinear Systems and the Lotka-Volterra Model_

October 18th, 2023

- Linearisation of a system in the vicinity of a stationary point
    - Shift of variables
    - Taylor series
- Solving the system using the Lotka-Volterra model with `ode45`
- Comparing the trajectory's "energy" to the corresponding isoline of the system's first integral
- Dependence of the $C$ and $L^2$ norms of the error on the integration time step $\tau$

## Seminar 9: _Modelling and Simulating Pendulum Motion_

November 1st, 2023

- Differential equation modeling of a pendulum system
  - Second-order ODE: $\frac{d^2 \theta}{dt^2} = -\omega^2 \sin(\theta)$
- Numerical solution using MATLAB's `ode45`
- Small angle approximation in the pendulum equation
  - Simplified to: $\frac{d^2 \theta}{dt^2} \approx -\omega^2 \theta$
- Conversion of the second-order ODE to two first-order ODEs
  - Implementation in MATLAB
- Approximate analytical solution for small angles
  - $\theta(t) = c_1 \cos(\omega t) + c_2 \sin(\omega t)$
- Visualization techniques
  - Angle vs Time plot with dynamic `comet` function
  - Cartesian coordinates representation
  - Phase portrait visualization using `quiver` function

## Seminar 10: _Analysis of a Pendulum with Damping and External Force: Practice_

November 8th, 2023

- Nonlinear ODE with Damping and External Force: Introduction of the equation $\frac{d^2\theta}{dt^2} + \frac{b}{m} \frac{d\theta}{dt} + \frac{g}{l} \sin(\theta) = F \sin(\alpha t)$.
- Conversion to First-Order ODEs: Transforming the second-order ODE into two first-order equations.
- Numerical Solution in MATLAB: Using MATLAB to solve the equations for various $\alpha$ values, exploring steady-state behaviors.
- Graphical Representation: Plotting pendulum oscillation amplitudes against driving frequency $\alpha$.
- Analysis: Discussing resonance phenomena and the impact of damping on oscillation amplitude.

## Seminar 13: _Lagrange Interpolation and Error Analysis_

November 29th, 2023

- **Introduction to Lagrange Polynomial Interpolation**:
    - Concept and mathematical formulation of the Lagrange interpolation method.
    - The significance of polynomial interpolation in numerical analysis.
- **Runge's Phenomenon and Node Selection**:
    - Exploring Runge's phenomenon in the context of polynomial interpolation.
    - Importance of node selection, comparing uniform and Chebyshev nodes.
- **MATLAB Implementation and Practical Application**:
    - Utilizing `LagrangeInterpolate.m` function for interpolating Runge's function.
    - MATLAB coding practices for implementing and analyzing interpolation methods.
- **Error Analysis and Comparison**:
    - Quantitative assessment of interpolation errors using uniform and Chebyshev nodes.
    - Analyzing the error behavior and its dependency on the number of nodes.
- **Graphical Visualization of Errors**:
    - Creating plots in MATLAB to visualize interpolation errors for different node distributions.
    - Graphical comparison of errors for varying numbers of nodes.
- **Lebesgue Constant in Error Estimation**:
    - Calculation and graphical representation of the Lebesgue constant for different grids.
    - Analyzing the maximum interpolation error as a function of the number of nodes.

## Seminar 14: _Splines, Padé Approximation, and Symbolic Computations in MATLAB_

December 6th, 2023

- **Splines and Boundary Conditions**:  
    - Construction of spline functions in MATLAB.
    - Emphasis on boundary conditions for spline interpolation.
    - Comparison with MATLAB's built-in `spline()` function.
- **Interpolation Error Analysis**:
    - Investigating the interpolation error for splines on a uniform grid.
    - Error quantification using the $C$ norm and $L^2$ norm.
    - MATLAB code for error computation and graphical representation.
- **Introduction to Padé Approximation**:
    - Concept and mathematical background of Padé approximants.
    - Comparison of approximation accuracy between Padé and Taylor series.
    - MATLAB implementation of Padé approximants for different polynomial degrees.
- **Practical Application Examples**:
    - Padé approximation for functions like $\sin(x)$ and $\ln(x)$.
    - Graphical comparison of the original function and its Padé approximation in MATLAB.
- **Symbolic Computations in MATLAB**:
    - Introduction to symbolic computations using MATLAB's Symbolic Math Toolbox.
    - Practical examples demonstrating symbolic variable definition and function manipulation.
    - Graphical visualization of symbolic expressions and their approximations.

## Seminar 15: _Shooting Method and Fourier Series Decomposition_

December 13th, 2023

- **Shooting Method for Boundary Value Problems**:
    - Conversion of second-order ODEs to first-order systems.
    - Implementation in MATLAB, iterating through initial slopes.
    - Visualization of solution paths.
- **Fourier Series Demonstration**:
    - Fourier series for $f(x)=-x/2$.
    - Plotting function and its Fourier series in MATLAB.
    - Fourier series for its derivative.
- **Analytical and Visual Comparison**:
    - Comparing numerical solutions with theoretical.
    - Interpretation of results from both Shooting Method and Fourier series analyses.
