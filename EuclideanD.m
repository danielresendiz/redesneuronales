function r=EuclideanD(X,x)
  [fil col]=size(X);
  for i=1:fil
    r(i) = sqrt(dot(x-X(i,1:col-1),x-X(i,1:col-1)));
  end
endfunction

