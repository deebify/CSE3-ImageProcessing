%Clear the Console
clc;
%Delete All Memory Variables/Close All Windows
clear all;
close all;

pkg load image;
%{
  Low Pass Filter is allow to only pass low frequency in the image 
  and try to surpress the high frequency into (averaging) lower ranges 
  
  For Example: 
    Let's assume we've an 1D array show an Line Image 
    
     Line Image = 1 1 1 1 1 1 9 9 9 9 9 9 9 9 1 1 1 1 1 1 1 
                  low freq   --  low feq     --   low freq
     
     -- dashes mean high frequency transition 
     Note that there's a huge transition between 
      1 -> 9 so a low pass filter will try to 
      surpress thess transition into smaller values (Edges)
      and allow the low frequency to pass .. 
    
      The Low Pass Filter for 1D is 1/3 * [ 1 1 1 ]
      
%}

img1D = [ 1 1 1 1 1 1 255 255 255 255 255 255 1 1 1 1 1 1 ];
%Filted [1 1 1 1 1 86 170 255 255 255 255 170 86 1 1 1 1 1];
img1D = im2double(img1D/255);
filter = 1 / 3 * [ 1 1 1 ]; 

subplot(2,1,1);
imshow(img1D); 
title("Original 1D Image Line")

filtered = imfilter(img1D,filter);

subplot(2,1,2);
imshow(filtered);
title("After Low Pass Filter")

%{
      For Images as 2D the Low Pass Filter is 
      based on Filter Kernel 3 x 3 filter will be 1/9 [1 1 1; 1 1 1; 1 1 1]
      1/9 because the kernel was 3 x 3
      
      if kernel 7 x 7 
      then factor of filter will be 1/49 
      [ 1 1 1 1 1 1 1;
        1 1 1 1 1 1 1;
        1 1 1 1 1 1 1;
        1 1 1 1 1 1 1;
        1 1 1 1 1 1 1;
        1 1 1 1 1 1 1;
        1 1 1 1 1 1 1;
        ] 

%}

img_2D = imread('hc.jpg');
sf = 7;% size of the Filter 
filter = (1/(sf*sf))* ones(sf);

figure;
subplot(1,2,1);
imshow(img_2D); 
title("Original 2D Image")

filtered = imfilter(img_2D,filter,'replicate');%boundary option, output size -- ,'replicate','same'

subplot(1,2,2);
imshow(filtered);
title("After Low Pass Filter on 2D Image")

%{
  But We Need to Be the Same Size as Original 
   Becasue filter eliminate pixels we need to 
   add pixels to do padding the image so that after 
   applying filter it will return to the same size 
   
   4rd paramter (output size) to imfilter 'same' or use 'full'
   use 3rd parameter (boundary option) to image we applying the filter
   we've option (replicate, symmetric)
   
   Also called Smoothing Filter or Averaging Filter
   
   %}



