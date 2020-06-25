clc
x=dlmread('datos.csv',',',1,0);
clases=x(:,end);
clasesUnicas=unique(clases)
frecuencias=zeros(length(clasesUnicas),1);
probsClase=zeros(length(clasesUnicas),1);
for i=1:length(clasesUnicas)
  frecuencias(i)=sum(clases==clasesUnicas(i));
  ProbsClase(i,1)=frecuencias(i,1)/length(clases);
endfor

valoresDifVariable=unique(x(:,1))
[r c]=size(x);
for k=1:c-1
  valoresDifVariable=unique(x(:,k));
  for i=1:length(valoresDifVariable)
    for j=1:length(clasesUnicas)
      probscondicionales(i,j,k)=sum(x(:,k)==valoresDifVariable(i)&x(:,end)==clasesUnicas(j))/sum(x(:,end)==clasesUnicas(j));
    endfor
  endfor
endfor
probscondicionales

indices=randperm(length(clases));
indicestraining=1:round(length(indices)*0.66);
indicesTest=setdiff(indices,indicestraining);