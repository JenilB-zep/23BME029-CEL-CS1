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
