clc;
clear;
close all;

% Load image
img = imread('cameraman.tif');
%! img = im2bw(img);
%! img = 255 * uint8(img);
figure; imshow(img);
title('Original image');

% Save as RLE
rleSave('cameraman.rle', img);
rle = rleLoad('cameraman.rle');
figure; imshow(rle);
title('RLE image');
