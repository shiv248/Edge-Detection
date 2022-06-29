function [outputImage] = spatial_filter(inputImage,filterType)

inputImage = double(inputImage);

imageSize = size(inputImage);
imageR = imageSize(1);
imageC = imageSize(2);
 
filterSize = size(filterType);
filterR = filterSize(1);
filterC = filterSize(2);

paddedImage = padarray(inputImage, [filterR, filterC] ,'both');

filteredImage = zeros(size(inputImage));

filterCalculation = 0;

for R = 1: imageR
    for C = 1: imageC
        for i = -1:1
            for j = -1:1
                filterCalculation =  filterCalculation + (paddedImage(R+i+filterR,C+j+filterC) * filterType(i+2,j+2));
            end
        end
        filteredImage(R,C) = filterCalculation;
        filterCalculation = 0;
    end
end

outputImage = double(filteredImage);
end
