#Clear the Console
clc;
#Delete All Memory Variables/Close All Windows
clear all;
close all;

%{
  ImageEnhancement.m 
  Different ways to Enhance the given image. 

  1- Histogram Equalization - using histeq()
  2- Contrast Adjustment - using imadjust()
  
%}
# Using the Contrast Adjustment 

%{
    1- Read Image (RGB)
    2- Convert it to Double (Normalization)
    
    3- Show Original and Adjusted Image in Subplot
    4- Show Histogram for Both Original and Adjusted Image
%}
pkg load image;
x = imread('mi.jpg');
x = im2double(x);

#use Subplot to show multiple images at on figure

subplot(1,2,1);
imshow(x);
title('Original RGB Image')

subplot(1,2,2);
#get adjusted image
x_adj = imadjust(x);
imshow(x_adj);
title("Auto-Adjusted Image")


#Show Histogram for Both Image Before and After Adjustment
figure;
subplot(1,2,1);
#Get GrayScale, Show Histogram
x_gs = rgb2gray(x);
hist(x_gs);
title("Histogram Before Adjustment")

subplot(1,2,2);
x_gs_adj = rgb2gray(x_adj);
hist(x_gs_adj);
title("Histogram After Adjustment");




