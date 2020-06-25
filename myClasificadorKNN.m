%UNIVERSIDAD AUTÓNOMA DEL ESTADO DE MÉXICO
%CENTRO UNIVERSITARIO UAEM ZUMPANGO
%INGENIERÍA EN COMPUTACIÓN
%UA: Redes Neuronales 2018-B
%Daniel Alejandro Rodriguez Resendiz
clc
%toma los datos del archivo datos.csv y guardalos en la matriz X
X=dlmread('datoskn.csv',',',1,0);
%declar r y c como los valores de el tamaño en filas y columnas
[filas columnas]=size(X);
%calcula la media y la desviacion estandart para posteriormente normalizar los datos
medias = mean(X(:,1:end-1));
desviacionesStd  =std(X(:,1:end-1));
%NORMALIZAR LOS X
Normal=(X(:,1:end-1).*medias)./desviacionesStd;
%Calcular las distancias desde x (normalizado)a cada muestra
%del conjunto de X normalizado
%Encontrar los k vecinos m?s cercanos
%Determinar la clase
Punto = 3;
x = X(Punto,1:end-1);%Define un vector que represente el punto a evaluar
opcion=0;
while(opcion<2)
opcion=input("\n\nElija que distancia desea que se maneje \n 1-Distancia Euclidiana \n 2.-Distancia Manhattan\n Elija una opcion: " );

  switch opcion
      case 1
          %inplementa la funcion EuclideanD
          Dist=EuclideanD(X,x);
          opcion=5;
      case 2
          %inplementa la funcion ManhattanD
          Dist=ManhattanD(X,x);
          opcion=5;
      otherwise
          disp('Error, Elija un opcion correcta')
          opcion=0;
  end
end

suma=0;
for i=1 :10
  %organizar de forma aletoria numero del 1 al tamaño de la matriz X
  valores=randperm(size(X,1));
  %elegir el 66% que son 9 elemntos del conjunto de 14
  prueba=valores(1:round(size(X,1)*0.30));
  %evaluar la compracion en los X elegidos
  XNueva=X(prueba,:);
  Normalnew=Normal(prueba,:);
  Normaliza = XNueva(:,end) ==X(Punto,end);
  %normaliza valores iguale a los de la clase
  for j=1:45
    if Normaliza(j)==1 
      XNueva(j,1:end-1)=Normalnew(j,:);
    end
  end
  [valores indices] = sort(Dist);
  K = 3;%Parametro del algoritmo(vecinos)
  indicesVecinos  = indices(1:K);
  vecinos = X(indicesVecinos,end)
  XNueva(:,end);
  suma=suma+(sum(X(Punto,end)==vecinos(:,1)));
endfor
  
  fprintf("el promedio de efectividad es de %d por ciento ",sum(suma/K)*10)
