function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  [m n] = size(FeatureMatrix);
  Error = 0;
  for i = 1 : m
    tmp = h_theta(Theta, FeatureMatrix(i, :)) - Y(i);
    Error += tmp * tmp;
  end
  Error = Error / m + lambda * norm(Theta, 1);
endfunction