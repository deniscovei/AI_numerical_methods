function [classes] = predict_classes(X, weights, ...
                  input_layer_size, hidden_layer_size, ...
                  output_layer_size)
  m = size(X)(1);
  
  Theta1 = reshape(weights(1 : hidden_layer_size * (input_layer_size + 1)), ...
                           hidden_layer_size, input_layer_size + 1);
  Theta2 = reshape(weights(hidden_layer_size * (input_layer_size + 1) + 1: size(weights)(1)), ...
                          output_layer_size, hidden_layer_size + 1);
  
  A_1 = [ones(1, m); X'];
  
  Z_2 = Theta1 * A_1;
  A_2 = [ones(1, m); sigmoid(Z_2)];
  
  Z_3 = Theta2 * A_2;
  H = sigmoid(Z_3);
  
  [~, classes] = max(H);
  classes = classes';
  
endfunction
