function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  [m n] = size(FeatureMatrix);
  A = FeatureMatrix' * FeatureMatrix;
  
  if (!all(eig(A) > 0))
    Theta = zeros(1, n + 1);
    return
  endif
    
  b = FeatureMatrix' * Y;
  r = b;
  v = b;
  x = zeros(n, 1);
  tol_sq = tol * tol;
  k = 1;
  while k <= iter && r' * r > tol_sq
    t = r' * r / (v' * A * v);
    x = x + t * v;
    r_prev = r;
    r = r - t * A * v;
    s = (r' * r) / (r_prev' * r_prev);
    v = r + s * v;
    k++;
  end
  Theta = [0; x]';
endfunction