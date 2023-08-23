function adjMatrix = CVG(A)

long = length(A);
B = zeros(long);

for i = 1:long - 1

    for j = i + 2:long
        if numel(find((A(j) - A(i)) / (j - i) < ((A(i + 1:j - 1) - A(i)) ./ ([1:j - i - 1]))) == 1) == (j - i - 1)
            B(i, j) = 1;

        end
    end

end

B = B + B';

adjMatrix = B;