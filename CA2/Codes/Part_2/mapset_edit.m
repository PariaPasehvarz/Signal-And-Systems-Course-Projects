clc
close all;
clear;
[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s=[path,file];
picture=imread(s);
picture=imresize(picture,[100 80]);
picture=rgb2gray(picture);
threshold = graythresh(picture);
picture = imbinarize(picture,threshold);
picture=logical(picture);
imwrite(picture,'edited.png')