%Método Newton Raphson
function [x,convergencia,error,operaciones] = newtonRaphson(x0,tol,iteraciones,f,df)
    %Se definen las varaibles que se utilizarán
    x=x0;
    e=abs(f(x));
    iters=0;
    convergencia=[];
    operaciones= 0;
    error=[];
    while (e>tol && iters<iteraciones )
        %Fórmula del Método de Newton Raphson
        x = x - f(x)/df(x) ;
        %Operaciones aritmeticas
        operaciones = operaciones + 2;
        e=abs(f(x));
        error=[error,e];    
        convergencia=[convergencia,x]; 
        iters = iters + 1;
    end
end
