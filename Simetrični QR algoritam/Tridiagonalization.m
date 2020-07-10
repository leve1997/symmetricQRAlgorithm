function [A] = Tridiagonalization(A)
% ulazni parametri: simetricna matrica A
% program koji racuna tridijagonalnu matricu T = Q'AQ
% gdje je matrica Q produkt Housholderovih reflektora
n = max(size(A));
for k = 1:n - 2
    [v, beta] = Householder(A(k + 1:n, k)); 
    % namjestamo stupce rucno...
    H = eye(n - k) - beta * (v * v');
    % moglo je i Hx = x - s*v, s = v'x/beta
    A(k + 1:n, k) = H * A(k + 1:n, k);
    p = beta * A(k + 1:n, k + 1:n) * v;
    w = p - (beta * p' * v / 2) * v;
    A(k + 1, k) = norm(A(k+1:n, k));
    A(k, k + 1) = A(k + 1, k);
    A(k + 1:n, k + 1:n) = A(k + 1:n, k + 1:n) - v * w' - w * v';
end
end

