function [ imOut ] = denoise( image, kernel_type, kernel_size )
B = zeros(size(image));
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
% Only handle if the size of kernel is odd
pad_size = (kernel_size-1)/2;
padded_image = padarray(image, [pad_size, pad_size]);
for i= 1:size(image,1)
    for j=1:size(image,2)
        filter=zeros(kernel_size*kernel_size,1);
        index=1;
        for x=1:kernel_size
            for y=1:kernel_size
                filter(index)= padded_image(i+x-1,j+y-1);
                index=index+1;
            end
        end
        result=sort(filter);
        %place the median or the average in the imOut
        if(strcmp(kernel_type, 'median'))
            B(i,j) = result((kernel_size*kernel_size+1)/2);
        elseif(strcmp(kernel_type, 'box'))
            B(i,j) = sum(result ./ (kernel_size * kernel_size));
        end
    end
end
imOut = uint8(B);
end

