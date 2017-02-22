function [ imOut ] = compute_LoG( image ,LOG_type )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
% we can use fspecial function according to the TA in piazza
% 1 means use gaussian smoothing in advance of taking the laplacian
% 2 means directy taking the laplacian
% 3 means taking difference between two Gaussians
imOut = zeros(3,3);
laplacian = fspecial('laplacian');
gaussian = fspecial('gaussian');
if(strcmp(LOG_type, '1'))
    gauss_image = imfilter(image, gaussian);
    imOut = imfilter(gauss_image, laplacian);
elseif(strcmp(LOG_type, '2'))
    imOut = imfilter(image, laplacian);
elseif(strcmp(LOG_type, '3'))
    sigma1 = 5;
    sigma2 = 7;
    gaussian1 = fspecial('gaussian', [3 3], sigma1);
    gaussian2 = fspecial('gaussian', [3 3], sigma2);
    delta_gaussian = gaussian2 - gaussian1;
    imOut = imfilter(image, delta_gaussian);
end

