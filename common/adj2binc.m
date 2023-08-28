function [ Adj_List ] =adj2binc(Adj_Matrix)
%输入邻接矩阵，输出邻接表

Length=size(Adj_matrix,1);
Adj_List=[];

for index_i=1:Length
    for index_j=1:Length
        if a(index_i,index_j)==1;
            Adj_List=[Adj_List;index_i index_j];
            a(index_j,index_i)=0;
        end
    end
end

end