function [path] = heuristic_greedy(start_position, probabilities, Adj)
  n = size(probabilities)(1);
  win_state = n - 1;
  lose_state = n;

  path = start_position;
  visited = zeros(n, 1);
  visited(start_position) = 1;

  while (!isempty(path))
    position = path(end);

    if (position == win_state)
      path = path';
      return;
    end

    next = 0;
    next_prob = 0;

    for neigh = 1 : n
      if (Adj(position, neigh) == 1 && !visited(neigh))
        if (probabilities(neigh) > next_prob)
          next = neigh;
          next_prob = probabilities(neigh);
        end
      end
    end

    # check if position has no unvisited neighbours
    if (next == 0)
      path(end) = [];
    else
      visited(next) = 1;
      path(end + 1) = next;
    end
  end

  path = path';
endfunction
