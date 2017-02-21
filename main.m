test = 'myHistMatching';%denoise myHistMatching 
if(strcmp(test ,'denoise'))
    I = imread('Images/image2.jpeg');
    gray_I = rgb2gray(I);
    medfilter_I = denoise(gray_I, 'box', 7);
    imshow(medfilter_I);
elseif(strcmp(test ,'myHistMatching'))
    input = imread('Images/input.png');
    reference = imread('Images/reference.png');
    match_im = myHistMatching( input, reference );
end