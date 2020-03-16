

I1 = imread('C:\\Users\\ms\\Documents\\MATLAB\\images\\left1\\left2511.jpg');
I2 = imread('C:\\Users\\ms\\Documents\\MATLAB\\images\\right1\\right2511.jpg');

if ~exist('stereoParams','var')
load('stereoparams.mat', 'stereoParams');
end

I1 = undistortImage(I1,stereoParams.CameraParameters1);
I2 = undistortImage(I2,stereoParams.CameraParameters2);

I1=rgb2gray(I1);
I2=rgb2gray(I2);

I1 = imbinarize(I1,0.25);
I2 = imbinarize(I2,0.25);

[regions1,mserCC1] = detectMSERFeatures(I1);
stats1 = regionprops('table',mserCC1,'Eccentricity','Area');
eccentricityIdx1 = stats1.Eccentricity < 0.75 & stats1.Area > 150 ;
circularRegions1 = regions1(eccentricityIdx1);

% figure
% imshow(I1); hold on;
% plot(circularRegions1);

% cr1=region(I1);
% cr2=region(I2);

[regions2,mserCC2] = detectMSERFeatures(I2);
stats2 = regionprops('table',mserCC2,'Eccentricity','Area');
eccentricityIdx2 = stats2.Eccentricity < 0.75 & stats2.Area > 150;
circularRegions2 = regions2(eccentricityIdx2);
figure
imshow(I1); hold on;
plot(circularRegions1);

% figure
% imshow(I2); hold on;
% plot(circularRegions2);

epiLines1 = epipolarLine(stereoParams.FundamentalMatrix,circularRegions1.Location);
% pt = lineToBorderPoints(epiLines1,size(I2));
% figure 
% imshow(I2)
% hold on
% line(pt(:,[1,3])',pt(:,[2,4])')
d_R=dist_from_line(circularRegions2.Location,epiLines1);

[m, mi]= min(d_R);
%ud_points1 = undistortPoints(point1,stereoParams.CameraParameters1);
%ud_points2 = undistortPoints(point2,stereoParams.CameraParameters1);
point(1,:) = triangulate(circularRegions1.Location(1,:),circularRegions2.Location(mi(:,1),:),stereoParams);
point(2,:) = triangulate(circularRegions1.Location(2,:),circularRegions2.Location(mi(:,2),:),stereoParams);
point(3,:) = triangulate(circularRegions1.Location(3,:),circularRegions2.Location(mi(:,3),:),stereoParams);
point(4,:) = triangulate(circularRegions1.Location(4,:),circularRegions2.Location(mi(:,4),:),stereoParams);

a=ginput(2);

dist(a,circularRegions2.Location,point)







