%% Initialization
clc
clear
close all
%% Input Image

[file, path] = uigetfile({'*.jpg;*.bmp;*.png;*.tif'}, 'Choose an image of a license plate');
picture = imread([path, file]);

%% License Plate Detection
load_bluestrip();
boundingBoxes = detect_bluestrip(picture);
%% Recognition
result = [];
for i = 1:size(boundingBoxes, 1)
    pictureCropped = imcrop(picture, boundingBoxes(i, :));
    imshow(pictureCropped);
    find_plate(pictureCropped);
end
