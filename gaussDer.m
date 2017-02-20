function [ conv_, Gd ] = gaussDer( image, G, sigma )
kernel_size = length(G);
x = linspace(-kernel_size / 2, kernel_size / 2, kernel_size);
Gd = (-x/sigma^2) .* G;
length(Gd)
length(image)
conv_ = conv2(double(Gd), double(image), 'full');
length(conv_)
end

