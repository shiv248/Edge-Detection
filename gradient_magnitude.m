function [outputImage] = gradient_magnitude(inputImage)

inputImage = double(inputImage);

filterY = [-1,-2,-1; 
           0,0,0; 
           1,2,1];
       
filterX = [-1,0,1; 
           -2,0,2; 
           -1,0,1]; 
       
imageSize = size(inputImage);
imageR = imageSize(1);
imageC = imageSize(2);

outputImage = zeros(imageR,imageC);

gradientImageX = spatial_filter(inputImage,filterX);
gradientImageY = spatial_filter(inputImage,filterY);

for R = 1 : imageR
    for C = 1 : imageC
        outputImage(R,C) = sqrt((gradientImageX(R,C)^2) + (gradientImageY(R,C)^2));
    end
end

outputImage = double(outputImage);
end
