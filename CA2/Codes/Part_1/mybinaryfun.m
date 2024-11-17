function binary_image = mybinaryfun(original_image)

% SET THRESHOLD VALUE
threshold = graythresh(original_image);

% MAKE IMAGE IN BINARY FORMAT
binary_image = imbinarize(original_image,threshold);

% MAKE COLOURS SIMILAR TO MAPSET
binary_image = ~binary_image;