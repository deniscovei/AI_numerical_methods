function prediction = h_theta (Theta, x)
  n = size(x)(2);
  prediction = 0;
  for j = 1 : n
    prediction = prediction + Theta(j + 1) * x(j);
  end
endfunction
