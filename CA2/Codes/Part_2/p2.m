clc
close all;
clear;

%% SELECTING THE TEST DATA
[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s=[path,file];
picture=imread(s);
figure
imshow(picture)
picture=imresize(picture,[300 450]);

%% RGB2GRAY and CONVERSION TO A BINARY IMAGE
picture=rgb2gray(picture);
threshold = graythresh(picture);
picture = imbinarize(picture,threshold);
picture=~picture;
SMALL_OBJECT_AREA = 500;
BACKGROUND_AREA =6000;
picture_remove_small = bwareaopen(picture, SMALL_OBJECT_AREA);
background = bwareaopen(picture_remove_small, BACKGROUND_AREA);
picture2 = picture_remove_small - background;

%% Labeling Connected Pixel
figure
imshow(picture2)
[L,Nseg]=bwlabel(picture2);
Cordinate=regionprops(L,'BoundingBox');
hold on
for n=1:Nseg
    rectangle('Position',Cordinate(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off
 
%% Loading the mapset
create_mapset();
load TRAININGSET;
totalLetters = size(TRAIN, 2);

%% FIND LETTERS
final_output = [];
for n = 1:Nseg
    [r, c] = find(L == n);
    current_segment = picture2(min(r):max(r), min(c):max(c));
    current_segment = imresize(current_segment, [100, 80]);
    ro = zeros(1, totalLetters);
    for k = 1:totalLetters
       ro(k) = corr2(TRAIN{1,k}, current_segment);
    end
        % Find the best match
       [MAXRO, pos] = max(ro);
       if MAXRO > 0.6
           out = TRAIN{2, pos};
           final_output = [final_output out];
       end
end

%% Printing the plate

file = fopen('number_Plate.txt', 'wt');
fprintf(file,'%s\n',final_output);
fclose(file);
winopen('number_Plate.txt')
