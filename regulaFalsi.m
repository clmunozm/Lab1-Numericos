%Método Regula Falsi
function [c,convergencia,error,operaciones] = regulaFalsi(a,b,tol,iteraciones,f)
    %Se definen las variables que se utilizarán
    c=a;
    e = abs(f(c));
    error=[];    
    convergencia=[];
    operaciones = 0;
    iters=0;
    while (e>tol && iters<iteraciones)
        %Fórmula del Método Regula Falsi
        c = b - f(b)*(b-a)/(f(b)-f(a));
        %operaciones aritmeticas
        operaciones = operaciones + 5;
        if (f(c)==0)
            a=c;
            b=c;
        end
        if (sign(f(a)) == sign(f(c)))
            a = c;
        end
        if (sign(f(b)) == sign(f(c)))
            b = c;
        end
        e = abs(f(c));
        error = [error,e];
        convergencia = [convergencia,c];
        iters = iters + 1;
    end
end