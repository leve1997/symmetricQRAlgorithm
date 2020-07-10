% prvi primjer :
tol = 1e-10;
x = [1, 2, 3, 4];
D = diag(x);
Q = rand(4);
[Q, R] = qr(Q);
A = Q * D * Q';
SymetricQR(A, tol)
% mozemo probati i masinski epsilon tol = n * realmincla