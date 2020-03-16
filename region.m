function [circularRegions]= region(I1)
I1=rgb2gray(I1);
I1 = imbinarize(I1);
[regions,mserCC] = detectMSERFeatures(I1);
stats = regionprops('table',mserCC,'Eccentricity','Area');
eccentricityIdx1 = stats.Eccentricity < 0.85 & stats.Area > 150 ;
circularRegions = regions(eccentricityIdx1);
end