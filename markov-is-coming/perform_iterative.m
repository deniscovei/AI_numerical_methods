function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
  [n n] = size(G);
  succes = 0;
  steps = max_steps;
  x = zeros(n, 1);

  while (max_steps >= 0)
    max_steps--;

    x = G * x0 + c;

    err = norm(x - x0);

    if (err < tol)
      succes = 1;
      break;
    end

    x0 = x;
  end

  steps = steps - max_steps;
endfunction
