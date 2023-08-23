function b=ainc2adj(x)
if min(x)==0
    x=x+1;
end
d=length(x);
a=max(max(x));
b=zeros(a,a);
for i=1:d
    if x(i,1)==x(i,2)
        b(x(i,1),x(i,2))=0;
    else
        b(x(i,1),x(i,2))=1;
        b(x(i,2),x(i,1))=1;
    end
end