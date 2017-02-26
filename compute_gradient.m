function [ gx, gy, im_magnitude, im_direction ] = compute_gradient( image )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
sobel_x = [-1,0,1;-2,0,2;-1,0,1];
sobel_y = [1,2,1;0,0,0;-1,-2,-1];
% assuming that we are allowed to use convolve function from matlab
gx = conv2(double(image),double(sobel_x));
gy = conv2(double(image),double(sobel_y));
im_magnitude = uint8(sqrt(gx.^2 + gy.^2));
im_direction = uint8(atand(gy ./ gx));
gx = uint8(gx);
gy = uint8(gy);
end

