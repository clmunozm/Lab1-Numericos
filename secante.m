%Método de la Secante
function [x,convergencia,error,operaciones] = secante(x0, x1,tol,iteraciones,f)
    e=abs(f(x1));
    iters=0;
    convergencia=[];
    operaciones = 0;
    error=[];
    while (e>tol && iters<iteraciones )
        %Fórmula del Método de la Secante
        x = x1 - ((f(x1)*(x1-x0))/(f(x1)-f(x0) + 10e-15));
        %operaciones artimeticas
        operaciones = operaciones + 5;
        x0=x1;
        x1=x;
        e=abs(f(x));
        error=[error,e];    
        convergencia=[convergencia,x]; 
        iters = iters + 1;
    end
end