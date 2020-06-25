function dis=ManhattanD(X,x)
  [fil col]=size(X);
  dis=zeros(fil);
  for i=1:fil
    for j=1:col-1
      dis(i) =dis(i)+abs(x(j)-X(i,j));
    end
  end
endfunction