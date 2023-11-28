# Lagrange interpolation error

## 📚 Background

Polynomial interpolation, particularly through the method of Lagrange, is a critical technique for approximating complex functions that are computationally intensive to evaluate. When working with such functions, it's crucial to minimize the number of function evaluations, making the selection of interpolation nodes a task of paramount importance. Choosing the right nodes can lead to a more accurate and stable approximation, while poor selection can result in significant errors. The phenomenon of error amplification, notably in equidistant nodes, is highlighted by Runge's phenomenon, which is a stark example of the pitfalls of arbitrary node selection. The Lebesgue constant serves as a measure of the potential worst-case error, and the use of Chebyshev nodes is one strategy to mitigate the instability inherent in polynomial interpolation.

## 🎯 Objectives

1. **Understanding Interpolation Stability**: Delve into the stability of Lagrange interpolation and learn the significance of node selection on the resulting error.
2. **Practical MATLAB Application**: Gain hands-on experience with MATLAB by using a given interpolation function and understanding numerical outputs.
3. **Graphical Analysis**: Employ MATLAB to graphically demonstrate the Lebesgue constant for various grids, thereby visualizing interpolation errors.
4. **Critical Analysis**: Critically evaluate the outcomes to discern the effects of different node distributions on interpolation error, and synthesize observations about node choices.

## 📝 Problem Statement

- Step 1: Familiarize with Provided Function
  - Begin by reviewing the provided `LagrangeInterpolate.m` function to understand its implementation and output. You will use this function as a basis for your interpolation tasks.
- Step 2: Compute the Lebesgue Constant
  - Create a MATLAB script to compute and visualize the Lebesgue constant over the interval `[-1, 1]` for both uniform and Chebyshev grids.
- Step 3: Graphical Visualization
  - Generate plots of the Lebesgue constant against `x` for different numbers of nodes `N`, comparing the results between uniform and Chebyshev grids.
- Step 4: Error Analysis
  - For varying `N`, calculate the maximal Lebesgue constant over the interval `[-1, 1]` and plot these maxima against `N` to observe trends.
- Step 5: Comparative Study
  - Analyze your plots to compare the performance of uniform versus Chebyshev nodes in Lagrange interpolation, identifying which provides a more stable error behavior.
- Step 6: Conclusions
  - Conclude your investigation with a report that encapsulates your findings, focusing on the impact of node selection on Lagrange interpolation stability.

## 📊 Example Graphs

[Space for Example Graphs]

This section will feature visual guides representing the Lebesgue constant plots for both uniform and Chebyshev grids. These example graphs will guide students in understanding the expected patterns and the comparative stability of Lagrange interpolation across different node choices.
