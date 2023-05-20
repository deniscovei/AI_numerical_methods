function [Y, InitialMatrix] = parse_data_set_file(file_path)
  fid = fopen(file_path);
  m = fscanf(fid, '%d', 1);
  n = fscanf(fid, '%d', 1);

  Y = [];

  for i = 1 : m
    Y = [Y; fscanf(fid, '%d', 1)];
    line = fgetl(fid);
    for j = 1 : n
      [InitialMatrix{i, j}, line] = strtok(line);
    end
  end

  fclose(fid);
endfunction
