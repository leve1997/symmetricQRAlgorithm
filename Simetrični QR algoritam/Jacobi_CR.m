function [U,D] = Jacobi_CR( A,tol )
    n=max(size(A));
    U=eye(n);
    l=0;
    br=1;
    while br==1
        for i=1:n-1
            for j=i+1:n
                if(abs(A(i,j))>=tol)
                    %%odredi j.rot Urot
                    zeta=(A(j,j)-A(i,i))/(2*A(i,j));
                    tau=sign(zeta)/(abs(zeta)+sqrt(1+zeta*zeta));
                    prvi_zadnji=1/sqrt(1+tau*tau);
                    drugi=tau*prvi_zadnji;
                    Urot=eye(n);
                    Urot(i,i)=prvi_zadnji;Urot(j,j)=prvi_zadnji;
                    Urot(i,j)=drugi;Urot(j,i)=-drugi;
                    %%
                    A=Urot'*A*Urot;U=U*Urot;
                    l=0;
                    
                else
                    l=l+1;
                    if l==n*(n-1)/2
                        D=diag(A);
                        A
                        return;
                    end
                end
            end
        end
    end
    D=diag(A);
end