G = graph(G(:, 1), G(:, 2));
Deg_seq = degree(G);
Pk = hist(Deg_seq, 1:1:100);

plot(Pk, 'k')