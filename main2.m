I = imread('Images/image2.jpeg');
gray_I = rgb2gray(I);
medfilter_I = denoise(gray_I, 'box', 7);
imshow(medfilter_I);