function gray_scaled_image = mygrayfun(original_image)
Red_channel = original_image(:, :, 1);
Green_channel = original_image(:, :, 2);
Blue_channel = original_image(:, :, 3);

% GRAYSCALE CONVERSION FORMULA
Gray_channel = 0.299 * Red_channel + 0.578 * Green_channel + 0.114 * Blue_channel;

% CONVERT TO UNIT8 TO MATCH IMAGE FORMAT
gray_scaled_image = uint8(Gray_channel);