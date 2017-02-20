function [ kernel ] = gauss( sigma,kernel_size )
x = linspace(-kernel_size / 2, kernel_size / 2, kernel_size);
kernel = exp(-x .^ 2 / (2 * sigma ^ 2));
kernel = kernel / sigma * sqrt(2 * pi);
end

