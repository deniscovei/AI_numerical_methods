function [decoded_path] = decode_path(path, lines, cols)
  n = size(path)(1) - 1;
  decoded_path = [0 0];

  for i = 1 : n
    row = floor((path(i) - 1) / cols) + 1;
    col = mod(path(i), cols);
    if (col == 0)
      col = cols;
    end

    decoded_path = [decoded_path; [row col]];
  end

  decoded_path = decoded_path(2:n+1, 1:2);
endfunction
