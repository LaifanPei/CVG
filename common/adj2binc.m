function [ biao ] =adj2binc(a)%输入邻接矩阵，输出邻接表
n=size(a,1);
biao=[];
for i=1:n;
    for j=1:n
        if a(i,j)==1;
            biao=[biao;i j];
            a(j,i)=0;
        end
    end
end
end