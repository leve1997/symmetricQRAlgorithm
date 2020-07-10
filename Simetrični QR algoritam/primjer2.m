x = [1,2,3,4,5,6,7,8,9,10];
D = eye(20);
for i = 0:1
    D(10 * i + 1:10 * i + 10,10 * i + 1:10 * i + 10) = diag(x);
end
Q = rand(20);
[Q, R] = qr(Q);
A = Q * D * Q';
SymetricQR(A, tol);