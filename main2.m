test = 'gaussConv';%gaussDer gaussConv
if(strcmp(test ,'gaussConv'))
    kernel_size = [5, 10, 20, 30];
    sigmas_x = [0.5, 5, 10, 20];
    sigmas_y = [0.5, 5, 10, 20];
    n = 4;
    image = imread('cameraman.tif');

    for i = 1:n
        conv = gaussConv(image, sigmas_x(i), sigmas_y(i), kernel_size(i));
        subplot((n+2)/2,(n+2)/2,i); 
        imshow(conv, []);
        tit = [num2str(sigmas_x(i)),' ',num2str(sigmas_y(i)),' ',num2str(kernel_size(i))];
        title(tit);
    end
    
    matlab_sigma = 20;
    matlab_hsize = 30;
    H = fspecial('gaussian',matlab_hsize,matlab_sigma);
    res = imfilter(image, H);
    subplot((n+2)/2,(n+2)/2,n+1);
    imshow(res, []);
    title(strcat('original matlab: ',num2str(matlab_sigma),'-', num2str(matlab_sigma),'-',num2str(matlab_hsize)));
    
elseif(strcmp(test,'gaussDer'))
    image = imread('cameraman.tif');
    sigma = 0.5;
    kernel_size=5;
    G  = gauss( sigma,kernel_size );
    [conv, Gd ] = gaussDer( image, G, sigma );
    imshow(conv, []);
end
