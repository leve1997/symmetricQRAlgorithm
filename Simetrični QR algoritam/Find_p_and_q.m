function [p,q] = Find_p_and_q(D)
% nalazi najmanji p i najveci q t.d D33 bude diagonalna i D22
% Broj q dobijemo tako da setamo po dijagonali od gore prema dolje
% te mu pridružimo broj poèetnih uzastopnih nula. Kada naiðemo na 
% nenul element tada brojimo uzastopne nenul elemente. Ako izaðemo iz 
% dimenzija matrice ili naiðemo na 0 prestajemo brojati. 
n=max(size(D));
q=0;
n_p_q=0;
flag=0;

for i=n-1:-1:1
    if flag == 0 && D(i+1,i) ~= 0       
        flag = 1;
        n_p_q = 1;
    end
    
    if flag == 1 && D(i+1,i) == 0
        break;
    end
    if flag == 0
        q = q+1;
    end
    if flag==1
        n_p_q = n_p_q+1;
    end
end
if q == n - 1 && n_p_q == 0
    q = n;
end
p = n-n_p_q - q;
end