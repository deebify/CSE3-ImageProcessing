clc;
clear all;
close all;

pkg load image;

img = imread('hc.jpg');
img_gs = rgb2gray(img);

subplot(1,2,1)
imshow(img_gs);
title('Original GrayScale Image with Original Quality')

% decreasing the size 
s = size(img_gs);

reduced = 3;
p=1;
l=1;

for i=1:reduced:s(1)
  for j=1:reduced:s(2)
    c(p,l) = img_gs(i,j);
    l = l + 1;
  end
  p = p + 1;
  l = 1;
end

subplot(1,2,2);
imshow(c);
title('Compressed Image with Low Resolution 1/3')