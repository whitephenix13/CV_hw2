test = 'myHistMatching';%denoise myHistMatching 
if(strcmp(test ,'denoise'))
elseif(strcmp(test ,'myHistMatching'))
    input = imread('Images/input.png');
    reference = imread('Images/reference.png');
    match_im = myHistMatching( input, reference );
end