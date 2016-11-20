%Clear the Console
clc;
%Delete All Memory Variables/Close All Windows
clear all;
close all;

%{
  ImageEnhancement.m 
  Different ways to Enhance the given image. 

  1- Histogram Equalization - using histeq()
  2- Contrast Adjustment - using imadjust()
  
%}
% Using the Histogram Equalization 

%{
    1- Read Image (RGB)
    2- Convert it to Double (Normalization)
    3- Get the Grayscale Image (MUST for Histogram Equalization)
    
    3- Show Original Grayscale and Equalized Image in Subplot
    4- Show Histogram for Both Original and Adjusted Image
%}
pkg load image;
x = imread('aj.jpeg');
x = im2double(x);
x_gs = rgb2gray(x);

%use Subplot to show multiple images at on figure
subplot(1,2,1);
imshow(x_gs);
title('Original GrayScale Image')

subplot(1,2,2);
x_gs_eq = histeq(x_gs);
imshow(x_gs_eq);
title('Image After Histogram Equalization')

figure;

%Show Histogram for Both Image Before and After Adjustment
subplot(1,2,1);
hist(x_gs);
title('Histogram Before Equalization')

subplot(1,2,2);
hist(x_gs_eq);
title('Histogram After Equalization');