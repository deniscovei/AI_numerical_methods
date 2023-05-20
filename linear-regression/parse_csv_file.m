function [Y, InitialMatrix] = parse_csv_file(file_path)
  fid = fopen(file_path);

  Y = [];

  line = fgetl(fid);

  if (line == -1)
    return;
  end

  n = 0;
  while 1
    [t, line] = strtok(line, ",");

    if (isempty(line))
      break;
    end

    n++;
  end

  i = 1;
  while 1
    line = fgetl(fid);

    if (line == -1)
      break;
    end

    [value, line] = strtok(line, ",");
    Y = [Y; str2num(value)];

    for j = 1 : n
      [InitialMatrix{i, j}, line] = strtok(line, ",");
    end

    i++;
  end

  fclose(fid);
endfunction