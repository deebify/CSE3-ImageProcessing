%Clear the Console
clc;
%Delete All Memory Variables/Close All Windows
clear all;
close all;

% ----------------------------------------------------------
pkg load image;
% reading image
im = imread('aj.jpeg');

subplot(1,2,1);
imshow(im);
title('Original Image');


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

 
h = fspecial('sobel');
h = h'; % inverse -- Horizontal 

subplot(1,2,2)
edge = imfilter(im,h);
imshow(edge);
title('Horizontal Edge Detection Image using Sobel')

% ----------------------------------------------------------
figure;
subplot(1,3,1)
imshow(im);
title('Original Image');

noised = imnoise(im,"salt & pepper",0.5); % max noise = 1

subplot(1,3,2);
imshow(noised);
title('Noised Image with salt & pepper ')

noised_filter = medfilt2(noised);

subplot(1,3,3)
imshow(noised_filter)
title('Noised Image after Median Filter -- Cleaned')

