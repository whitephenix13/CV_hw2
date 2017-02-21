test = 'unsharp';%denoise myHistMatching compute_gradient unsharp compute_LoG
if(strcmp(test ,'denoise'))
    I = imread('Images/image2.jpeg');
    gray_I = rgb2gray(I);
    medfilter_I = denoise(gray_I, 'median', 7);
    imshow(medfilter_I);
elseif(strcmp(test ,'myHistMatching'))
    input = imread('Images/input.png');
    reference = imread('Images/reference.png');
    match_im = myHistMatching( input, reference );
elseif(strcmp(test ,'compute_gradient'))
elseif(strcmp(test ,'unsharp'))
    image = imread('Images/image4.jpeg');
    sigma= 50;
    kernel_size= 5;
    k=2;
    unsharp_im = unsharp( image,sigma,kernel_size,k );
    figure;
    subplot(1,2,1)
    imshow(image,[]);
    title('Original')
    subplot(1,2,2)
    imshow(unsharp_im,[]);
    title('unsharp')
elseif(strcmp(test ,'compute_LoG'))

end