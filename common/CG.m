M=ones(9);
N=eye(9,9);
Q=M-N;
C=Q;
G=graph(C);%��ȡ�����Ǿ���
plot(G,'NodeColor','k','MarkerSize',8,'EdgeColor','k','LineWidth',1,'NodeLabelMode','manual','NodeFontName','Time New Roman','NodeFontSize',18,'Layout','circle');
axis tight equal
axis off