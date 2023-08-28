function Adj_Matrix=ainc2adj(Adj_List)

if min(Adj_List)==0
    Adj_List=Adj_List+1;
end

Length_d=length(Adj_List);
Max_a=max(max(Adj_List));
Adj_Matrix=zeros(Max_a,Max_a);

for index_i=1:Length_d
    if Adj_List(index_i,1)==Adj_List(index_i,2)
        Adj_Matrix(Adj_List(index_i,1),Adj_List(index_i,2))=0;
    else
        Adj_Matrix(Adj_List(index_i,1),Adj_List(index_i,2))=1;
        Adj_Matrix(Adj_List(index_i,2),Adj_List(index_i,1))=1;
    end
end