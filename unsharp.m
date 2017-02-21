function [ imOut ] = unsharp( image,sigma,kernel_size,k )
%get smoothed image by applying gaussian filter
smoothed_im  = gaussConv( image,sigma,sigma,kernel_size );
smoothed_im(190:210,190:210)
[H,W] =size(image);
%get high passed version image by substracting the smoothed image to the
%original
pad = int64((kernel_size-1)/2);
high_passed_im = image;

test = 200 ;
high_passed_im(test,test)
smoothed_im(test-2,test-2)
high_passed_im(test,test)-smoothed_im(test-2,test-2)
for h=1+pad:(H-pad)
    for w=1+pad:(W-pad)
        high_passed_im(h,w)= high_passed_im(h,w)-smoothed_im(h-pad,w-pad);
    end
end
figure;
subplot(1,3,1);
imshow(image,[]);
subplot(1,3,2);
imshow(smoothed_im,[]);
subplot(1,3,3);
imshow(high_passed_im,[]);

%Strengthen the high passed image k times
high_passed_im=high_passed_im .*k;
%Add the strengthened image to the original one
imOut= imadd(image,high_passed_im);
end

