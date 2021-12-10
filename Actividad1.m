format short
syms x1 x2 x3 real

%Se define la tolerancia que se utilizará
tol = 10^-8;

%Se define un numero de iteraciones límite
iteraciones = 1000;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                                  %%%%%
%%%%  Parte 1: función f1 = x^2 - 60  %%%%%
%%%%                                  %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Se define la función f1 con su derivada df1
f1 = @(x) x^2 - 60;
df1 = @(x) 2*x;

%Se definen los puntos e intervalos que se utilizarán en los métodos
x0 = 3.1;
a=1;
b=9;

%Método de bisección
t = tic();
[B,convergenciaB,errorB,operacionesB] = biseccion(a,b,tol,iteraciones,f1);
t_biseccion1 = toc(t);
%Método Regula Falsi
t = tic();
[RF,convergenciaRF,errorRF,operacionesRF] = regulaFalsi(a,b,tol,iteraciones,f1);
t_falsi1 = toc(t);
%Método de Newton Raphson
t = tic();
[N,convergenciaN,errorN,operacionesN] = newtonRaphson(x0,tol,iteraciones,f1,df1);
t_newton1 = toc(t);
%Método de la Secante
t = tic();
[S,convergenciaS,errorS,operacionesS] = secante(x0,x0-1,tol,iteraciones,f1);
t_secante1 = toc(t);


%Gráfico Errores de f1
error_f1 = figure("Name","Errores Función f1");
title('Gráfico Errores f1');
xlabel('iteraciones');
ylabel('error');
hold on;
plot(errorB,'DisplayName','Error Bisección', 'Color','r');
plot(errorRF,'DisplayName','Error Regula Falsi', 'Color', 'b');
plot(errorN,'DisplayName','Error Newton Raphson', 'Color', 'y');
plot(errorS,'DisplayName','Error Secante', 'Color', 'g');
legend('show')
hold off;

%Gráfico de las aproximaciones de las raices de f1
figure("Name", "Ceros o Raíces de Función f1");
title('Gráfico Ceros de función f1');
xlabel('iteraciones');
ylabel('aproximación de ceros');
hold on;
plot(convergenciaB,'DisplayName','Método de Bisección','Color','r');
hold on;
plot(convergenciaRF,'DisplayName','Método Regula Falsi', 'Color','g');
hold on;
plot(convergenciaN, 'DisplayName','Método de Newton Raphson', 'Color','b');
hold on;
plot(convergenciaS,'DisplayName','Método de la Secante','Color','y');
legend('show')
hold off;

%Error a priori Método de Newton
ddf1 = 2;
Epriori_f1_N = [];
i=1;
while (i<size(errorN,2))
    E = ddf1/df1(convergenciaN(i)) * (errorN(i)^2) * (1/2);
    Epriori_f1_N = [Epriori_f1_N, E];
    i = i+1;
end
Eposteriori_f1_N = errorN(2:size(errorN,2));

%Gráfico Error a priori y posteriori
figure("Name","Error a priori y posteriori Newton f1");
title('Gráfico Error priori y posteriori Newton f1');
xlabel('iteraciones');
ylabel('error');
hold on;
plot(Epriori_f1_N,'DisplayName','Error a priori Newton', 'Color','r');
plot(Eposteriori_f1_N,'DisplayName','Error a posteriori Newton', 'Color', 'b');
legend('show')
hold off;

%Error a priori Método de Secante
ddf1 = 2;
Epriori_f1_S = [];
i=2;
while (i<size(errorS,2))
    E = ddf1/df1(convergenciaS(i)) * (errorS(i)*errorS(i-1)) * (1/2);
    Epriori_f1_S = [Epriori_f1_S, E];
    i = i+1;
end
Eposteriori_f1_S = errorS(3:size(errorS,2));

%Gráfico Error a priori y posteriori
figure("Name","Error a priori y posteriori Secante f1");
title('Gráfico Error priori y posteriori Secante f1');
xlabel('iteraciones');
ylabel('error');
hold on;
plot(Epriori_f1_S,'DisplayName','Error a priori Secante', 'Color','r');
plot(Eposteriori_f1_S,'DisplayName','Error a posteriori Secante', 'Color', 'b');
legend('show')
hold off;


itersB = size(errorB,2);
itersRF = size(errorRF,2);
itersN = size(errorN,2);
itersS = size(errorS,2);
%Tabla con los resultados de f1 para cada método
Metodo = {'Bisección';'Regula Falsi';'Newton Raphson';'Secante'};
Raices_f1 = [B;RF;N;S];
Tiempo = [t_biseccion1;t_falsi1;t_newton1;t_secante1];
Operaciones = [operacionesB;operacionesRF;operacionesN;operacionesS];
Error = [errorB(itersB);errorRF(itersRF);errorN(itersN);errorS(itersS)];
Tabla1 = table(Metodo,Raices_f1,Error,Tiempo, Operaciones);
disp(Tabla1);

%Gráfico de barras Tiempo
figure("Name", "tiempo por cada método empleado en f1");
title('tiempo empleado por cada método en f1');
hold on;
bar(categorical(Metodo), Tiempo)
hold off;

%Gráfico de barras Operaciones
figure("Name", "Número de operaciones artimeticas por cada método empleado en f1");
title('número de operaciones realizadas por cada método en f1');
hold on;
bar(categorical(Metodo), Operaciones, 'red')
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                                                      %%%%%
%%%%  Parte 2: función f2 = x^3 - 2*(x^2) + log((2*x)+1)  %%%%%
%%%%                                                      %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Definición de la funcion f2 y su derivada df2
f2 = @(x) x^3 - 2*(x^2) + log((2*x)+1);
df2 = @(x) 3*(x^2) - 4*x + (2/(2*x + 1));

%Se definen los puntos e intervalos que se utilizarán en los métodos
x0_f2 = -0.4;
a_f2 = -0.4;
b_f2 = 3;

%Método de biseccón
t = tic();
[B2,convergenciaB2,errorB2,operacionesB2] = biseccion(a_f2,b_f2,tol,iteraciones,f2);
t_biseccion2 = toc(t);
%Método Regula Falsi
t = tic();
[RF2,convergenciaRF2,errorRF2,operacionesRF2] = regulaFalsi(a_f2,b_f2,tol,iteraciones,f2);
t_falsi2 = toc(t);
%Método de Newton Raphson
t = tic();
[N2,convergenciaN2,errorN2,operacionesN2] = newtonRaphson(x0_f2,tol,iteraciones,f2,df2);
t_newton2 = toc(t);
%Método de la Secante
t = tic();
[S2,convergenciaS2,errorS2,operacionesS2] = secante(a_f2,b_f2,tol,iteraciones,f2);
t_secante2 = toc(t);

%Gráfico Errores de f2
error_f2 = figure("Name","Errores Función f2");
title('Gráfico Errores f2');
xlabel('iteraciones');
ylabel('error');
hold on;
plot(errorB2,'DisplayName','Error Bisección', 'Color','r');
plot(errorRF2,'DisplayName','Error Regula Falsi', 'Color', 'b');
plot(errorN2,'DisplayName','Error Newton Raphson', 'Color', 'y');
plot(errorS2,'DisplayName','Error Secante', 'Color', 'g');
legend('show')
hold off;

%Gráfico de las aproximaciones de las raices de f2
figure("Name", "Ceros o Raíces de Función f2");
title('Gráfico Ceros de función f2');
xlabel('iteraciones');
ylabel('aproximación de ceros');
hold on;
plot(convergenciaB2,'DisplayName','Método de Bisección','Color','r');
hold on;
plot(convergenciaRF2,'DisplayName','Método Regula Falsi', 'Color','g');
hold on;
plot(convergenciaN2, 'DisplayName','Método de Newton Raphson', 'Color','b');
hold on;
plot(convergenciaS2,'DisplayName','Método de la Secante','Color','y');
legend('show')
hold off;


itersB2 = size(errorB2,2);
itersRF2 = size(errorRF2,2);
itersN2 = size(errorN2,2);
itersS2 = size(errorS2,2);
%Tabla con los resultados de f2 para cada método
Metodo = {'Bisección';'Regula Falsi';'Newton Raphson';'Secante'};
Raices_f2 = [B2;RF2;N2;S2];
Tiempo = [t_biseccion2;t_falsi2;t_newton2;t_secante2];
Operaciones = [operacionesB2;operacionesRF2;operacionesN2;operacionesS2];
Error = [errorB2(itersB2);errorRF2(itersRF2);errorN2(itersN2);errorS2(itersS2)];
Tabla2 = table(Metodo,Raices_f2,Error,Tiempo,Operaciones);
disp(Tabla2);

%Gráfico de barras Tiempo
figure("Name", "tiempo por cada método empleado en f2");
title('tiempo empleado por cada método en f2');
hold on;
bar(categorical(Metodo), Tiempo)
hold off;

%Gráfico de barras Operaciones
figure("Name", "Número de operaciones artimeticas por cada método empleado en f2");
title('número de operaciones realizadas por cada método en f2');
hold on;
bar(categorical(Metodo), Operaciones, 'red')
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                                   %%%%%
%%%%  Parte 3: Sistema de ecuaciones:  %%%%%
%%%%  F = {x(1)^2 + x(2) - 37 ;        %%%%%
%%%%       x1 - (x(2)^2) - 5 ;         %%%%%
%%%%       x(1) + x(2) + x(3) - 3}     %%%%%
%%%%                                   %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Definicion Sistema de ecuación no lineal F
F = @(x) [x(1)^2 + x(2) - 37;x1 - (x(2)^2) - 5;x(1) + x(2) + x(3) - 3];
X = [1,1,1];

%Metodo de Newton Raphson en varias variabls.
[NV, convergenciaNV,errorNV] = newtonRaphsonV(X,tol,F, iteraciones);

%Gráfico Errores de F
figure("Name","Errores sistema de ecuaciones F");
title('Gráfico Errores de F (Método de Newton en varias variabl)');
xlabel('iteraciones');
ylabel('error');
hold on;
plot(errorNV(1,:),'DisplayName','Error de x1','Color','r');
hold on;
plot(errorNV(2,:),'DisplayName','Error de x2','Color','g');
hold on;
plot(errorNV(3,:),'DisplayName','Error de x3','Color','b');
legend('show')
hold off;

%Gráfico de las aproximaciones de las raices de F
figure("Name", "Ceros o Raíces de Función de F");
title('Gráfico Ceros de función de F');
xlabel('iteraciones');
ylabel('aproximación de ceros');
hold on;
plot(convergenciaNV(1,1:size(convergenciaNV,2)),'DisplayName','Aproximaciónes de x1','Color','r');
plot(convergenciaNV(2,1:size(convergenciaNV,2)),'DisplayName','Aproximaciónes de x2','Color','g');
plot(convergenciaNV(3,1:size(convergenciaNV,2)),'DisplayName','Aproximaciónes de x3','Color','b');
legend('show')
hold off;

%Tabla con los resultados de F con el método de Newton en varias variables
Variable = {'x1';'x2';'x3'};
Raices_F = NV(1:3,size(NV,2));
Error = errorNV(1:3,size(errorNV,2));
Tabla3 = table(Variable,Raices_F,Error);
disp(Tabla3);
