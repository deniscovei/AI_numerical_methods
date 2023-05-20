function [matrix] = initialize_weights(L_prev, L_next)
  eps = sqrt(6) / sqrt(L_prev + L_next);
  matrix = eps * (2 * rand(L_next, L_prev + 1) - ones(L_next, L_prev + 1));
endfunction
