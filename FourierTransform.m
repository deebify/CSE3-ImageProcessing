%Clear the Console
clc;
%Delete All Memory Variables/Close All Windows
clear all;
close all;

%{
    Image can be processed in 2 way, Frequency Domain, and Spatial Domain. 
      We use (Spatial Domain -- Image described as Pixels).
      Frequency Domain (is image described as Frequencies in Hz).
      There's another representation "Time Domain"
      
     The Conversion we use --> Fourier Transform 
      The Fourier Transform is used to decompose an image into 
      its sine and cosine components 
      
%}

f = zeros(30,30);
f(5:24,13:17) = 1;

figure;imshow(f);

F = fft2(f);
# F_LOG = log(abs(F)); -- for Testing
X = F(:);
size_F = size(X);
figure;plot([1:size_F(1)],X);
