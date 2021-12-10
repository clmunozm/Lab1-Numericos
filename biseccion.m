%Método de la bisección
function [m,convergencia,error,operaciones] = biseccion(a,b,tol,iteraciones,f)
    m = (b-a)/2;
    e = abs(f(m));
    error=[];    
    convergencia=[];
    operaciones = 0;
    iters=0;
    while (e>tol && iters<iteraciones)
        m = a + (b-a)/2;
        operaciones = operaciones + 3;
        if (f(m)==0)
            a=m;
            b=m;
        end
        if (sign(f(a)) == sign(f(m)))
            a = m;
        end
        if (sign(f(b)) == sign(f(m)))
            b = m;
        end
        e = abs(f(m));
        error = [error,e];
        convergencia = [convergencia,m];
        iters = iters + 1;
    end
end