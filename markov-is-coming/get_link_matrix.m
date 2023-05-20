function [Link] = get_link_matrix(Labyrinth)
  [m n] = size(Labyrinth);
  Link = sparse(m * n + 2, m * n + 2);

  win_state = m * n + 1;
  lose_state = m * n + 2;

  Link (win_state, win_state) = 1;
  Link (lose_state, lose_state) = 1;

  drow = [-1 0 1  0];
  dcol = [ 0 1 0 -1];

  Lab_size = nnz(Labyrinth);
  [row col v] = find(Labyrinth);

  count = 1;

  for j = 1 : n
    for i = 1 : m
      if (count <= Lab_size && row(count) == i && col(count) == j)
        north = bitget(v(count), 4);
        east = bitget(v(count), 2);
        south = bitget(v(count), 3);
        west = bitget(v(count), 1);
        p = 1 / (4 - north - east - south - west);

        count++;

        wall = [north east south west];
      else
        p = 1 / 4;
        wall = [0 0 0 0];
      end
      state = (i - 1) * n + j;

      # iterate through all neighbours
      for k = 1 : 4
        if (wall(k) == 0)
          neigh_row = i + drow(k);
          neigh_col = j + dcol(k);

          # get the neighbour's state
          if (neigh_row == 0 || neigh_row == m + 1)
            neigh_state = win_state;
          elseif (neigh_col == 0 || neigh_col == n + 1)
            neigh_state = lose_state;
          else
            neigh_state = (neigh_row - 1) * n + neigh_col;
          end

          # add element to the matrix
          Link(state, neigh_state) = p;
        end
      end
    end
  end
endfunction