%Clear the Console
clc;
%Delete All Memory Variables/Close All Windows
clear all;
close all;

pkg load image;
%{
  High Pass Filter is allow to only pass high frequency in the image are passed out 
   high frequency which is high transtions from pixel to pixel
  
  For Example: 
    Let's assume we've an 1D array show an Line Image 
    
     Line Image = 1 1 1 1 1 1 9 9 9 9 9 9 9 9 1 1 1 1 1 1 1 
                  low freq   --  low feq     --   low freq
         
      The Low Pass Filter for 1D is 1/3 * [ -1 2 -1 ]
      
%}

img1D = [ 1 1 1 1 1 1 255 255 255 255 255 255 1 1 1 1 1 1 ];
img1D = im2double(img1D/255);
filter = 1 / 3 * [ -1 2 -1 ]; 

subplot(2,1,1);
imshow(img1D); 
title("Original 1D Image Line")

filtered = imfilter(img1D,filter);

subplot(2,1,2);
imshow(filtered);
title("After High Pass Filter")

%{
      For Images as 2D the Low Pass Filter is 
      based on Filter Kernel 3 x 3 filter will be 1/9 [1 1 1; 1 1 1; 1 1 1]
      1/9 because the kernel was 3 x 3
      
      if kernel 3 x 3 
      then factor of filter will be 1/49 
      [ -1 -1 -1 
        -1  8 -1
        -1 -1 -1
      ]  
%}

img_2D = imread('hc.jpg');
kernel = [
        -1 -1 -1 
        -1  8 -1
        -1 -1 -1
      ]; 
% use can change the kernel factor 3 or 9 to contorl filter
filter = (1/3) * kernel; 

figure;
subplot(1,2,1);
imshow(img_2D); 
title("Original 2D Image")

filtered = imfilter(img_2D,filter,'replicate','same');%boundary option, output size -- ,'replicate','same'

subplot(1,2,2);
imshow(filtered);
title("After High Pass Filter on 2D Image")

%{
  But We Need to Be the Same Size as Original 
   Becasue filter eliminate pixels we need to 
   add pixels to do padding the image so that after 
   applying filter it will return to the same size 
   
   4rd paramter (output size) to imfilter 'same' or use 'full'
   use 3rd parameter (boundary option) to image we applying the filter
   we've option (replicate, symmetric)
   
    Can be used to detect the edges 
    becasue the edges is a high transistion from pixel to another.   
   %}