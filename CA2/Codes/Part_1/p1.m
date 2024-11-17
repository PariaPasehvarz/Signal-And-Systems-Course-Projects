clc
close all;
clear;

% 1.SELECTING THE TEST DATA
[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s=[path,file];
picture=imread(s);
figure
imshow(picture)

% 2.RESIZE THE IMAGE
picture=imresize(picture,[300 500]);
figure
imshow(picture)

% 3.CREATE BLACK & WHITE IMAGE
gray_scaled_image=mygrayfun(picture);
figure
imshow(gray_scaled_image)

% 4.CREATE BINARY IMAGE
binary_image=mybinaryfun(gray_scaled_image);
figure
imshow(binary_image)

% 5.1 CLEAR SMALL NOISES
new_binary_image=myremovecom(binary_image, 400); 
figure
imshow(new_binary_image)

% 5.2 REMOVE BACKGROUND
back_ground = myremovecom(new_binary_image, 2500);
figure
imshow(back_ground)
clear_picture = new_binary_image-back_ground;
figure
imshow(clear_picture)

% 6. DO SEGMENTATION
figure
imshow(clear_picture)
[L,Nseg]=mysegmentation(clear_picture);
Cordinate=regionprops(L,'BoundingBox');
hold on
for n=1:Nseg
    rectangle('Position',Cordinate(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off

% Extract x-coordinates (BoundingBox(1)) for sorting
x_positions = arrayfun(@(x) x.BoundingBox(1), Cordinate);

% Sort based on the x-coordinate (left-to-right order)
[~, sortIdx] = sort(x_positions);

% LOAD MAPSET
load TRAININGSET;
totalLetters=size(TRAIN,2);

%7. DECISION MAKING
figure
final_output=[];
t=[];

for n=1:Nseg
    idx = sortIdx(n);  % Get sorted index
    [r,c]=find(L==idx);
    Y=clear_picture(min(r):max(r),min(c):max(c));
    imshow(Y)
    Y=imresize(Y,[42,24]);
    imshow(Y)
    pause(0.5)

    ro=zeros(1,totalLetters);

    for k=1:totalLetters   
        ro(k)=corr2(TRAIN{1,k},Y);
    end

    [MAXRO,pos]=max(ro);
    % Uncomment these lines if you want to see correlation between o and 0
    % in test case 2
    % if idx == 7
    %         figure
    %         plot(abs(ro));
    % end
    if MAXRO> 0.45
        out=TRAIN{2,pos};       
        final_output=[final_output out];
    end
end

% 8. WRITE DETECTED PLATE NUMBER IN A FILE
file = fopen('number_Plate.txt', 'wt');
fprintf(file,'%s\n',final_output);
fclose(file);
winopen('number_Plate.txt')
