function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  lines = size(X)(1);
  
  v = randperm(lines);
  X_cp = X;
  y_cp = y;
  for i = 1 : lines
    X(i, :) = X_cp(v(i), :);
    y(i, :) = y_cp(v(i), :);
  end

  X_train = X(1 : floor(percent * lines), :);
  X_test = X(floor(percent * lines) + 1: end, :);
  
  y_train = y(1 : floor(percent * lines), :);
  y_test = y(floor(percent * lines) + 1: end, :);
endfunction
