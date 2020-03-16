function [d] = dist_from_line(pts,lines) 
d=zeros(4,4);
for i=1:size(lines)
    line=lines(i,:);
    d(:,i)= abs(line(1)*pts(:,1)+ line(2)*pts(:,2)+line(3))/sqrt(line(1)^2+line(2)^2);
end

end
