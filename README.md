# 23BME029-CEL-CS1
# 23BME029 — Case Study 1: Power Iteration Method

---

## Overview
This code uses the **Power Method** to compute the **dominant (largest in magnitude) eigenvalue** and its corresponding **eigenvector** of a square matrix.

**Key Features:**
- Iterative algorithm for finding largest eigenvalue
- Uses scaling method to maintain numerical stability
- Converges when successive estimates differ by less than tolerance

---

## 1. Problem Description

Given a square matrix **A**, find:
- **λ (lambda):** The dominant eigenvalue (largest absolute value)
- **v:** The corresponding eigenvector

**Method Requirements:**
- Matrix A must have a dominant eigenvalue where |λ₁| > |λ₂|
- Initial vector must be non-zero

---

## 2. MATLAB Code
```matlab
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
fprintf('Eigen Vector: %.6f\n', v);
```

---

## 3. Mathematical Formulation

**Power Method Algorithm:**  
Starting with initial vector v⁽⁰⁾ = [1; 1; 1]

**Iteration Steps:**
```
(1) v = A * v          →  Matrix multiplication
(2) λ = max(|v|)       →  Find largest component
(3) v = v / λ          →  Normalize (scaling)
(4) err = |λ - λ_old|  →  Calculate error
(5) Repeat until err < tolerance
```

**Convergence:** When |λ_new - λ_old| < 10⁻⁶

---

## 4. Scaling Method

**Why Scaling?**
- Prevents vector components from growing unboundedly
- Maintains numerical stability during iteration
- The scaling factor (max component) approximates the eigenvalue

**Process:**  
At each iteration, divide all components by `max(|v|)`.  
This keeps vector components manageable while **preserving direction**.

---

## 5. Algorithm Flow
```
START
  ↓
Initialize: A, v=[1;1;1], tol=1e-6, err=1, L_old=0
  ↓
LOOP (while err > tol):
  ├─ v = A * v          [Multiply]
  ├─ L = max(|v|)       [Extract max]
  ├─ v = v / L          [Scale/Normalize]
  ├─ err = |L - L_old|  [Check convergence]
  └─ L_old = L          [Update]
  ↓
OUTPUT: L (eigenvalue), v (eigenvector)
  ↓
END
```

---

## 6. Advantages & Limitations

| | Detail |
|---|--------|
| ✅ **Simple implementation** | Easy to code and understand |
| ✅ **Works for large matrices** | Scales well with size |
| ✅ **Memory efficient** | Only needs matrix-vector multiplication |
| ❌ **Only finds largest eigenvalue** | Cannot find all eigenvalues |
| ❌ **Requires dominant eigenvalue** | Must have \|λ₁\| > \|λ₂\| |
| ❌ **Slow convergence** | If eigenvalues are close in value |

---

## 7. Applications

### In Physical Systems

| System | What Largest Eigenvalue Represents |
|--------|-----------------------------------|
| **Structural Engineering** | Maximum stress or vibration frequency before failure |
| **Electrical Circuits** | Maximum frequency response in a circuit network |
| **Mechanical Vibrations** | Dominant natural frequency of a vibrating system |
| **Heat Transfer** | Maximum rate of heat spreading through a material |

> **Example:** A bridge has a matrix representing its stiffness. The largest eigenvalue tells engineers the **maximum load frequency** before the bridge resonates and collapses.

---

### In Data Systems

| System | What Largest Eigenvalue Represents |
|--------|-----------------------------------|
| **PCA (Machine Learning)** | Direction of maximum variance in data |
| **Google PageRank** | Most important/influential webpage |
| **Image Compression** | Most dominant features to keep in an image |
| **Network Analysis** | Most connected/influential node in a network |

> **Example:** In a recommendation system like Netflix, the largest eigenvalue helps find the **most dominant user preference pattern** from millions of data points.

---

## 8. Result Interpretation

| Result | Meaning |
|--------|---------|
| **Eigen Value = 9.325883** | System grows or oscillates at this maximum rate |
| **Eigen Vector = [0.35, 0.16, 1.00]** | Direction in which the dominant effect acts |

---

## Summary

> **Largest Eigenvalue = The maximum speed, strength, or influence a system can have —  
> whether it's a vibrating bridge, spreading heat, or ranking webpages.**

---
