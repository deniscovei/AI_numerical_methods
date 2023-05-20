function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  [m n] = size(FeatureMatrix);
  Error = 0;
  for i = 1 : m
    tmp = h_theta(Theta, FeatureMatrix(i, :)) - Y(i);
    Error += tmp * tmp / (2*m);
  end
endfunction