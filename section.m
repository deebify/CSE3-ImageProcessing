clc;
clear all;
pkg load image;
# imread() -- read image into matrix -- 
# imwrite() -- write image given matrix
A = imread('1.jpg');
imwrite(A,'MatrixA.jpg');


# rgb2gray() convert image to Grayscale 
grayimg = rgb2gray(A);

#Extract individual layer into three variables 
R = A(:,:,1);
G = A(:,:,2);
B = A(:,:,3); 

# Create Matrix (Zeros elements) given size 
Z = zeros(size(grayimg)); # Zeros matrix of the same size 

#show the Black, then Red, then Green, then Blue Layers
figure;imshow(cat(3,Z,Z,Z));title("All Black Zero Matrix");
figure;imshow(cat(3,R,Z,Z));title("Red Layer")
figure;imshow(cat(3,Z,G,Z));title("Green Layer")
figure;imshow(cat(3,Z,Z,B));title("Blue Layer")

#Transformation 

#Linear Transformation -- Increasing Brightness
figure;imshow(grayimg*3);title("Increasing Matrix Image Intensity")
figure;imshow(grayimg/3);title("Decreasing Matrix Image Intensity")

# Inverse 
#TODO NEXT Sec. 

# Log Transformation
#TODO NEXT Sec.

# Power-Log Transf.
#TODO NEXT Sec. 


