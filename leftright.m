
function [] = leftright(img)
i=randi([1,10000]);
s='C:\\Users\\ms\\Documents\\MATLAB\\images\\left\\left%d.jpg';
str = sprintf(s,i);
s1='C:\\Users\\ms\\Documents\\MATLAB\\images\\right\\right%d.jpg';
strr=sprintf(s1,i);
leftimg=img(1:1080,1:1520,1:3);
rightimg=img(1:1080,1521:3040,1:3);
imwrite(leftimg,str);
imwrite(rightimg,strr);

end

