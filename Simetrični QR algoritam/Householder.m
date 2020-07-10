function [u, Beta] = Householder(x)
% ulazni parametar - vektor x 
% izlazni parametri - vektor u iz definicije Householderovog reflektora
% i skalar beta, takoðer iz definicije
%   formula H = I - beta * u * u'
n = max(size(x));
e = eye(n,1);

u = x + sign(x(1)) * norm(x) * e;
Beta = 2/(u' * u);
end

