clc;
clear all;
close all;
pkg load image;
# imread() -- read image into matrix -- 
# imwrite() -- write image given matrix
A = imread('aj.jpeg');
#Show the Image
figure;imshow(A);
title('Original Image')
#impixelinfo; #to show RGB values -- Work only in MATLAB not Octave
imwrite(A,'MatrixA.jpg');


# rgb2gray() convert image to Grayscale 
gs = rgb2gray(A);
#Size of Matrix 
size(gs) # without ';' to be printed on console

#Extract individual layer into three variables 
R = A(:,:,1);
G = A(:,:,2);
B = A(:,:,3); 

# Create Matrix (Zeros elements) given size 
Z = zeros(size(gs)); # Zeros matrix of the same size 
# Zeros Matrix is special command to get matrix with all zero elements 
# given size zeros(4) 4x4 zeros matrix 
# zeros(3,2) 3 by 2 matrix with all zero elements
# special matrices ones()/zeros()/magic()/rand()

figure;
#show the Black, then Red, then Green, then Blue Layers
subplot(1,3,1);
imshow(cat(3,R,Z,Z));
title('Red Layer')

subplot(1,3,2);
imshow(cat(3,Z,G,Z));
title('Green Layer')

subplot(1,3,3);
imshow(cat(3,Z,Z,B));
title('Blue Layer')


#------------------------------------------------------------------------------
#Transformation 
figure;
#Linear Transformation -- Increasing Brightness
subplot(1,2,1)
imshow(gs*3);
title('Increasing Matrix Image Intensity')

subplot(1,2,2)
imshow(gs/3);
title('Decreasing Matrix Image Intensity')

figure;
# Inverse
# Subtract the Largest Level of Pixel Level
# if it was 255 become 0 and if it was 0 i will become 255 
# this is the complement or inverse 
inv = 255 - gs;
inv_fun = imcomplement(gs); 
subplot(1,3,1);
imshow(gs);
title('Original GrayScale Image')

subplot(1,3,2);
imshow(inv);
title('Inverse with Subtraction');

subplot(1,3,3);
imshow(inv_fun);
title('Inverse with Complement Function');



# Log Transformation
  #USAGE: used to increase the detail (or contrast) of lower intensity values
  # g = c*log(1 + double(f)) image must be double class
  # 2^n/log(1+2^n) for n bits 
c = 1.4; # the higher c, the higher brigtness will the image be  
gs = im2double(gs);
figure;
subplot(1,3,1);
imshow(gs);
title('Original Grayscale Image')

subplot(1,3,2);
gs_log = c * log(1 + gs);
imshow(gs_log)
title('Log Transformation with C = 1.4')
c = 1.9;
subplot(1,3,3)
gs_log_1 = c * log(1 + gs);
imshow(gs_log_1);
title('Log Transofrmatoin with C = 1.9')


# Power-Log Transf./ Gamma Transofrmation 
# Will be Explained in Image Enhancement Code. 


