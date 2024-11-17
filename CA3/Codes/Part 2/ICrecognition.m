function ICrecognition(IC_image,PCB_image)
pcb_image_rgb = imread(PCB_image);
ic_image = imread(IC_image);

pcb_image_gray = rgb2gray(pcb_image_rgb);
ic_image_gray = rgb2gray(ic_image);

ic_image_rotated = imrotate(ic_image_gray, 180);

result1 = normxcorr2(ic_image_gray, pcb_image_gray);      
result2 = normxcorr2(ic_image_rotated, pcb_image_gray);

threshold = 0.5;
[y1, x1] = find(abs(result1) >= threshold);
[y2, x2] = find(abs(result2) >= threshold);

y_coords = [y1; y2];
x_coords = [x1; x2];
template_sizes = [repmat(size(ic_image_gray), length(y1), 1); repmat(size(ic_image_rotated), length(y2), 1)];

imshow(pcb_image_rgb); hold on;

for i = 1:length(y_coords)
    y_offset = y_coords(i) - template_sizes(i, 1);
    x_offset = x_coords(i) - template_sizes(i, 2);
    rectangle('Position', [x_offset, y_offset, template_sizes(i, 2), template_sizes(i, 1)], ...
              'EdgeColor', 'b', 'LineWidth', 2);
end

title('Detected ICs');
hold off;

end