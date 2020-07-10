function [D] = SymetricQR(A, tol)
% konacna QR metoda za simetricnu matricu A uz zadanu toleranciju tol
% racuna svojstvene vrijednosti od A
n = max(size(A));
A = Tridiagonalization(A);
A = tril(A);
A = A + diag(diag(A, -1), 1);
D = A;
q = 0;

while q < n
    for i = 1:n - 1
        if abs(D(i + 1, i)) <= tol * (abs(D(i, i)) + abs(D(i + 1, i + 1)))
            D(i + 1, i) = 0;
        end
        [p, q] = Find_p_and_q(D);
        if q < n
            % moramo neke if-ove, inace ce ici od npr 0:0 i to
            D(p + 1:n - q, p + 1:n - q) = QRshifts(D(p + 1:n - q, p + 1:n - q));
            D
            p
            q
        end
    end
end
end