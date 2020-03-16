% print all six distances
function []= dist(a,cr,point)
d=zeros(4);
f=zeros(2);
for i=1:2
    for j=1:4
    d(j)=norm(cr(j,:)-a(i,:));
    end
    [~,ni]=min(d);
    f(i)=ni(1);
end
norm(point(f(1),:)-point(f(2),:))
end