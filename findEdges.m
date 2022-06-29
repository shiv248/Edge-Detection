function [outputImage] = findEdges(inputImage,thresh)
edgeImage = gradient_magnitude(inputImage);

outputImage = uint8(zeros(size(edgeImage)));

imageSize = size(inputImage);
imageR = imageSize(1);
imageC = imageSize(2);

for R = 1 : imageR
    for C = 1 : imageC
        
        if(edgeImage(R,C) < thresh)
            outputImage(R,C) = 0;
        else
            outputImage(R,C) = 255;
        end
        
    end
end

imshow(outputImage);
end
