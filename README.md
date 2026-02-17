# 23BME029-CEL-CS1
CASE STUDY 1 
This  code uses the Power Method to compute the dominant
(largest in magnitude) eigenvalue and its corresponding eigenvector
of a square matrix.
Key Features:
- Iterative algorithm for finding largest eigenvalue
- Uses scaling method to maintain numerical stability
- Converges when successive estimates differ by less than tolerance
  
2. PROBLEM DESCRIPTION

Given a square matrix A, find:
- λ (lambda): The dominant eigenvalue (largest absolute value)
- v: The corresponding eigenvector
Method Requirements:
- Matrix A must have a dominant eigenvalue where |λ₁| > |λ₂|
- Initial vector must be non-zero


3 MATLAB CODE 
clc;
clear all;

A = [0, 2, 3; 1, 1, 1; 0, 2, 9];
v = [1; 1; 1];
tol = 1e-6;
err = 1;
L_old = 0;

while err > tol
    v = A * v;
    L = max(abs(v));
    v = v / L;
    err = abs(L - L_old);
    L_old = L;
end

fprintf('Eigen Value: %.6f\n', L);
fprintf('Eigen Vector:%.6f\n', v);


3. MATHEMATICAL FORMULATION

Power Method Algorithm:
Starting with initial vector v⁽⁰⁾ = [1; 1]
Iteration Steps:
(1) v = A * v [Matrix multiplication]
(2) λ = max(|v|) [Find largest component]
(3) v = v / λ [Normalize (scaling)]
(4) err = |λ - λ_old| [Calculate error]
(5) Repeat until err < tolerance
Convergence: When |λ_new - λ_old| < 10⁻⁶
