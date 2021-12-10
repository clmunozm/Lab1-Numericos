%Método Newton Raphson para varias variable
function[X, convergencia, error, operaciones] = newtonRaphsonV(X0,tol,f, iteraciones)
    %Se definen las variables que se utilizarán
    syms x1 x2 x3 real
    F = f([x1;x2;x3]); %funciones sistema de ecuaciones
    JF = jacobian(F); %jacobiano de las funciones del sistema de ecuaciones
    X = [];
    Xn = X0;
    error = [];
    convergencia = [];
    operaciones = 0;
    iters = 0;
    %Se evalua el vector inicial en f
    Fn = subs(F, [x1 x2 x3], [Xn(1) Xn(2) Xn(3)]);
    while (norm(double(Fn))>tol && iters < iteraciones)
        %Se evalua el vector actual en el jacobiano
        JFn = subs(JF, [x1 x2],[Xn(1) Xn(2)]);
        %Fórmula del Método de Newton Multivaraible
        Xn = Xn - inv(JFn)*Fn;
        error = [error,double(abs(Fn))];
        convergencia = [convergencia, double(Xn)];
        X = double(Xn);
        %Se remplaza fn con la nueva evaluación del nuevo vector en f
        Fn = subs(F, [x1 x2 x3], [Xn(1) Xn(2) Xn(3)]);
        iters = iters + 1;
    end
end
