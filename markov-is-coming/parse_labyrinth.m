function [Labyrinth] = parse_labyrinth(file_path)
  fid = fopen(file_path);
  m = fscanf(fid, '%d', 1);
  n = fscanf(fid, '%d', 1);
  Labyrinth = sparse(m, n);
  
  for i = 1 : m
    for j = 1 : n
      Labyrinth(i, j) = fscanf(fid, '%d', 1);
    end
  end
endfunction
