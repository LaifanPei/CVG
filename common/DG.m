G = graph(adjMatrix);
Deg_seq = degree(G);
Pk = hist(Deg_seq, 1:1:100) ./ 2000;

plot(Pk, 'k')
axis([0, 100, -0.05, 1.0])