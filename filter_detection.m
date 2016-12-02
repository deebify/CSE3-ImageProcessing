%Clear the Console
clc;
%Delete All Memory Variables/Close All Windows
clear all;
close all;

% ----------------------------------------------------------

% reading image
im = imread('aj.jpeg');

subplot(1,2,1);
imshow(im);
title('Original Image');


% creating noise using a filter 
h = fspecial('prewitt'); % defualt is Vertical Edge Detection
subplot(1,2,2)
edge = imfilter(im,h);
imshow(edge);
title('Edge Detection Image using Prewitt')


% ----------------------------------------------------------
figure;
subplot(1,2,1);
imshow(im);
title('Original Image');


% creating noise using a filter 
h = fspecial('sobel');
h = h'; % inverse -- Horizontal 

subplot(1,2,2)
edge = imfilter(im,h);
imshow(edge);
title('Edge Detection Image using Sobel')



