function [ conv ] = gaussConv( image,sigma_x,sigma_y,kernel_size )
kernel_x = gauss(sigma_x, kernel_size);
kernel_y = gauss(sigma_y, kernel_size);
conv = conv2(kernel_x, kernel_y, image, 'full');
end

