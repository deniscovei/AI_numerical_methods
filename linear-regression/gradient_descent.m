function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  Theta = zeros(1, n + 1);

  for step = 1 : iter
    for i = 1 : m
      predicted(i) = h_theta(Theta, FeatureMatrix(i, :));
    end
    
    for j = 1 : n
      Theta(j + 1) -= alpha * sum((predicted - Y') .* FeatureMatrix(1:m,j)') / m;
    end
  end
endfunction