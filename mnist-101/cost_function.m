function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)
  Theta1 = reshape(params(1 : hidden_layer_size * (input_layer_size + 1)), ...
                          hidden_layer_size, input_layer_size + 1);
  Theta2 = reshape(params(hidden_layer_size * (input_layer_size + 1) + 1: size(params)(1)), ...
                          output_layer_size, hidden_layer_size + 1);

  
  % number of trainings
  m = size(X)(1);
  
  % number of classes
  K = output_layer_size;
  
  y_vect = [];
  for i = 1 : m
    line = zeros(1, K);
    line(1, y(i)) = 1;
    y_vect = [y_vect; line];
  endfor
  
  A_1 = [ones(1, m); X'];
  
  Z_2 = Theta1 * A_1;
  A_2 = [ones(1, m); sigmoid(Z_2)];
  
  Z_3 = Theta2 * A_2;
  A_3 = sigmoid(Z_3);
  
  H = A_3';
  
  cost = sum(sum(-y_vect .* log(H) - (1 - y_vect) .* log(1 - H)));
  
  delta_3 = A_3 - y_vect';
  Delta_2 = delta_3 * A_2';
  
  delta_2 = (Theta2' * delta_3)(2 : end, :) .* sigmoid(Z_2) .* (1 - sigmoid(Z_2));
  Delta_1 = delta_2 * A_1';
  
  % sum of squares of Theta1 elements
  sum_Theta1 = sum(sumsq(Theta1(:, 2 : input_layer_size + 1)));
 
  % sum of squares of Theta2 elements
  sum_Theta2 = sum(sumsq(Theta2(:, 2 : hidden_layer_size + 1)));
  
  J = cost / m + lambda * (sum_Theta1 + sum_Theta2) / (2 * m);

  %grad1
  grad1(1 : hidden_layer_size, 1 : input_layer_size + 1) = ...
      Delta_1(1 : hidden_layer_size, 1 : input_layer_size + 1) / m;
  grad1(1 : hidden_layer_size, 2 : input_layer_size + 1) += ...
      lambda * Theta1(1 : hidden_layer_size, 2 : input_layer_size + 1) / m;

  %grad2
  grad2(1 : output_layer_size, 1 : hidden_layer_size + 1) = ...
      Delta_2(1 : output_layer_size, 1 : hidden_layer_size + 1) / m;
  grad2(1 : output_layer_size, 2 : hidden_layer_size + 1) += ...
      lambda * Theta2(1 : output_layer_size, 2 : hidden_layer_size + 1) / m;

  sz1 = hidden_layer_size * (input_layer_size + 1);
  sz2 = output_layer_size * (hidden_layer_size + 1);
  grad = [reshape(grad1, sz1, 1); reshape(grad2, sz2, 1)];
  
endfunction
