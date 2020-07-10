function [Q, k] = QRmetoda(A, tol, maxit)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Q = eye(max(size(A)));
for k = 1:maxit
    Q0 = Q;
    [Q, R] = qr(A);
    A = R * Q;
    if (norm(Q0 - Q) < tol)
        return;
    end
end
end

