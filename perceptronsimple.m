%UNIVERSIDAD AUTÓNOMA DEL ESTADO DE MÉXICO
%CENTRO UNIVERSITARIO UAEM ZUMPANGO
%INGENIERÍA EN COMPUTACIÓN
%UA: Redes Neuronales 2018-B
%Daniel Alejandro Rodriguez Resendiz
clc
%Leer datos linealmente separables
Datos=dlmread('linseparables2.csv',',',1,0)
[filas columnas]=size(Datos);
%guardar datos de X 
X=[ones(filas,1) Datos(:,1:end-1)];
%guardar datos de y
Y=[Datos(:,end)];
W=rand(1,3);
N=10;
%repetir desde 1 hasta el numero de interaciones N
for j=1:N
  %repetir hasta el tamaño de filas de X es decir hasta que xi no pertenezca al conjunto de X
  for i=1:filas
    %define variable auxiliar (WT)*(xi)
    aux=W'*X(i,:);
    %si aux es mayor o igual a 0
    if  aux>=0
      %variabke y=1
      y=1;
    %De lo contrario  
  else
    %variable y=0
      y=0;
    end
    %Actualiza W si yi-y=1 actualiza en +W 
    %si yi-y=-1 actualiza en sentido contrario de W
    %si yi-y=0 no se actuliza W
    W=W.+((Y(i,1)-y)*X(i,:));
  endfor
endfor  
W
