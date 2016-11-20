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
% Using the Contrast Adjustment given Ranges

%{
    1- Read Image (RGB)
    2- Convert it to Double (Normalization)
    
    3- Show Original and Adjusted Image in Subplot
    4- Show Histogram for Both Original and Adjusted Image
%}
pkg load image;
x = imread('mi.jpg');
x = im2double(x);
%the reason the image is double to make the normalization 
% range between 0 and 1 SO i can change its ranges

%use Subplot to show multiple images at on figure

subplot(1,2,1);
imshow(x);
title('Original RGB Image')

subplot(1,2,2);
%get adjusted image 
% imadjust(I,[low_in; high_in],[low_out; high_out])
% If high_out is less than low_out, imadjust reverses the output image, as in a photographic negative.
x_adj = imadjust(x,[0.3 0.5],[]); 
imshow(x_adj);imshow(x_adj);
title('Range Adjusted Image')


%Show Histogram for Both Image Before and After Adjustment
figure;
subplot(1,2,1);
%Get GrayScale, Show Histogram
x_gs = rgb2gray(x);
hist(x_gs);
title('Histogram Before Adjustment')

subplot(1,2,2);
x_gs_adj = rgb2gray(x_adj);
hist(x_gs_adj);
title('Histogram After Adjustment');


%% THE GAMMA Transformation
% USAGE: With Gamma Transformations, you can curve the grayscale components either 
% to brighten the intensity (when gamma is less than one) or 
% darken the intensity (when gamma is greater than one).
% In the oppsite way. show the diagram 
% Greater than 1 -- darker the image will be
% So on average use 0.4 

figure;
subplot(2,2,1);
imshow(x);
title('Original Image Gamma = 1 is Default')


subplot(2,2,2);
x_adj_a = imadjust(x,[],[],1.5); 
imshow(x_adj_a);
title('Gamma Correction = 1.5 -- Little Darker')

subplot(2,2,3);
x_adj_a = imadjust(x,[],[],0.4); 
imshow(x_adj_a);
title('Gamma Correction = 0.4 -- Little Brighter')

subplot(2,2,4);
x_adj_a = imadjust(x,[],[],3); 
imshow(x_adj_a);
title('Gamma Correction = 3 -- Very Dark')













