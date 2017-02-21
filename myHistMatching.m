function [ imOut ] = myHistMatching( input, reference )
    [H,W]= size(input);
    imOut=zeros(size(input));
    %get number of count per gray for input image
    [input_count, input_gray]= imhist(input);
    %get number of count per gray for reference image
    [ref_count, ref_gray]= imhist(reference);

    %Compute cumulative distribution functions F
    F1 = cumsum(input_count);
    %normalize it
    F1 = F1 ./ F1(end);
    
    F2 = cumsum(ref_count);
    %normalize it
    F2 = F2 ./ F2(end);
    
    %Compute matching array M such that for a gray color G1, we find G2 such
    %that M(G1) = G2 with F1(G1) = F2(G2)
    M=zeros(size(F1));
    g2 = 1 ;
    for g1 = 1:length(M)
        found=false; % keep track if we found matching value for g1
        while (~found)
            if(g2==1)
                if(F1(g1)<F2(g2))
                    M(g1)=0;
                    found=true;
                else
                    g2=g2+1;
                end

            elseif(g2>=length(M))
                M(g1) = length(M)-1;%=255
                found=true;
            elseif((F1(g1)>=F2(g2-1)) && (F1(g1)<F2(g2)))
                M(g1) = g2-1;
                found=true;
            else
                g2=g2+1;
            end
        end
    end
    %create tranformed image based on input image
    for h=1:H
        for w=1:W
            imOut(h,w)= M(input(h,w)+1);
        end
    end
    %recompute the count for the output image
    out_count = zeros(size(input_count));
    for i=1:length(input_count)
        %note that M(i) in [0,255]
        out_count(i)= input_count(M(i)+1);
    end
    %display reference image with histogram
    figure;
    subplot(1,2,1);
    imshow(reference,[])
    subplot(1,2,2);
    stem(ref_gray,ref_count);
    
    %display input image with histogram
    figure;
    subplot(1,2,1);
    imshow(input,[])
    subplot(1,2,2);
    stem(input_gray,input_count);
    
    %display result image with histogram
    figure;
    subplot(1,2,1);
    imshow(imOut,[])
    subplot(1,2,2);
    stem(input_gray,out_count);
end

