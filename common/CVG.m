function adjMatrix = CVG(Time_Series)

Long = length(Time_Series);
index = zeros(Long);

for i = 1:Long - 1

    for j = i + 2:Long
        if numel(find((Time_Series(j) - Time_Series(i)) / (j - i) < ((Time_Series(i + 1:j - 1) - Time_Series(i)) ./ ([1:j - i - 1]))) == 1) == (j - i - 1)
            index(i, j) = 1;

        end
    end

end

index = index + index';

adjMatrix = index;