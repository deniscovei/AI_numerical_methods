function [G, c] = get_Jacobi_parameters(Link)
  [n n] = size(Link);
  G = Link(1 : (n - 2), 1 : (n - 2));
  c = Link(1 : (n - 2), n - 1);
endfunction
