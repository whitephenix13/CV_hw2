function [ conv_, Gd ] = gaussDer( image, G, sigma )
kernel_size = length(G);
x = linspace(-kernel_size / 2, kernel_size / 2, kernel_size);
Gd = (-x/sigma^2) .* G;
conv_ = conv2(Gd, image, 'full');
end

