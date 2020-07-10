data=importdata('stieltjes_matr.txt');
A=zeros(100);
for i=1:100
    for j=1:100
        A(i,j)=data(100*(i-1)+j);
    end
end

tic
SymetricQR(A, tol);
toc
tic
[U, D] = Jacobi_CR(A, tol);
toc
tic
[Q, k] = QRmetoda(A, tol, 10000);
toc