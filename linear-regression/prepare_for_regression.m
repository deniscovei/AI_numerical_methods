function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  [m n] = size(InitialMatrix);
  FeatureMatrix = zeros(m, n);

  jrem = n;
  for i = 1 : m
    for j = 1 : n
      if (j > jrem)
        jj = j + 1;
      else
        jj = j;
      end

      if (strcmp(InitialMatrix{i, j}, "yes"))
        FeatureMatrix(i, jj) = 1;
      elseif (strcmp(InitialMatrix{i, j}, "no"))
        FeatureMatrix(i, jj) = 0;
      elseif (strcmp(InitialMatrix{i, j}, "semi-furnished"))
        FeatureMatrix(i, jj : jj + 1) = [1, 0];
        jrem = j;
      elseif (strcmp(InitialMatrix{i, j}, "unfurnished"))
        FeatureMatrix(i, jj : jj + 1) = [0, 1];
        jrem = j;
      elseif (strcmp(InitialMatrix{i, j}, "furnished"))
        FeatureMatrix(i, jj : jj + 1) = [0, 0];
        jrem = j;
      else
        FeatureMatrix(i, jj) = str2num(InitialMatrix{i, j});
      end
    end
  end
endfunction