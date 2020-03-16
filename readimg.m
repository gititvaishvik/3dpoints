function []=readimg()
matfiles = dir(fullfile('C:', 'Users','ms','Documents', 'MATLAB', 'img','*.jpg'));
for i=1:size(matfiles)
j=matfiles(i).name;
s = 'C:\\Users\\ms\\Documents\\MATLAB\\img\\%s';
str = sprintf(s,j);
data=imread(str);
leftright(data);
end

end
