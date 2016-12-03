%Clear the Console
clc;
%Delete All Memory Variables/Close All Windows
clear all;
close all;

pkg load image;
%{
  Image Filters: 
    Simply Filter is used to surpress/remove either high or low frequency 
    in the image
    For Ex: 
      Smoothing, Sharpen, Enhancing, and Detecting Edges in Images
    
    We can do all that just by use Kernel Filter (Feature Kernel)
    
   - Filter is a function that just applied on image. 
    
      Image as input -->  Linear Filter (Kernel) --> Image as Output
%}

%{
  Predefined Filters - which is filter already in MATLAB
   can be directly to images. 
   
   Filters created through fspecial(); 
   then we can apply imfilter() directly given that filter.
   
   fspecial() provide serveral of predefined filters. 
   
%}

% reading image
im = imread('aj.jpeg');

% creating a filter 
filter = fspecial('unsharp');


subplot(1,2,1);
imshow(im);
title('Original Image');

% applying filter using imfilter()
im_f = imfilter(im,filter);

subplot(1,2,2);
imshow(im_f);
title('Unsharp Filter Image');


% ----------------------------------------------------------

% creating a motion filter
% len, theta as 2rd, 3rd parameter
% len -- linear motion of camera, default = 9 
% theta -- degree of direction, default = 0
% default which corresponds to a horizontal motion of nine pixels
filter = fspecial('motion',10,180);

figure;
subplot(1,2,1);
imshow(im);
title('Original Image');

% applying filter using imfilter()
im_f = imfilter(im,filter);

subplot(1,2,2);
imshow(im_f);
title('Motion Filter Image');

% ----------------------------------------------------------

% creating a disk filter is used to blur image
% accept radius as blur cicle
% defualt is 5 
filter = fspecial('disk',2);

figure;
subplot(1,2,1);
imshow(im);
title('Original Image');

% applying filter using imfilter()
im_f = imfilter(im,filter);

subplot(1,2,2);
imshow(im_f);
title('Disk (Blur) Filter Image');



% ----------------------------------------------------------

% creating a gaussian filter is used to blur image as well as disk filter do.
% accept horizontal size which is [3 3] defualt
% and  sigma is 0.5 is default
filter = fspecial('gaussian',[6 6],2);

figure;
subplot(1,2,1);
imshow(im);
title('Original Image');

% applying filter using imfilter()
im_f = imfilter(im,filter);

subplot(1,2,2);
imshow(im_f);
title('Gaussian Filter Image');
