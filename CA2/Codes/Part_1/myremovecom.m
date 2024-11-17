function filtered_picture = myremovecom(binary_picture, threshold)
    % Get the coordinates of the '1's in the binary picture
    [row, col] = find(binary_picture == 1);
    POINTS = [row'; col'];
    POINTS_NUM = size(POINTS, 2);
    
    % Initialize
    if POINTS_NUM == 0
        filtered_picture = binary_picture; % If no points, return the original picture
        return;
    end
    
    initpoint = POINTS(:, 1);
    POINTS(:, 1) = [];
    POINTS_NUM = POINTS_NUM - 1;
    CurrectObject = [initpoint];
    t = 1;
    FINALOBJECT = {};  % Store connected objects
    
    % Find all connected objects
    while POINTS_NUM > 0
        [POINTS, newPoints] = close_points(initpoint, POINTS);
        newPoints_len = size(newPoints, 2);
        CurrectObject = [CurrectObject newPoints];
        
        while newPoints_len > 0
            initpoint = newPoints(:, 1);
            newPoints(:, 1) = [];
            [POINTS, newPoints2] = close_points(initpoint, POINTS);
            CurrectObject = [CurrectObject newPoints2];
            newPoints = [newPoints newPoints2];
            newPoints_len = size(newPoints, 2);
        end
        
        % Only add to FINALOBJECT if it has more than 'threshold' pixels
        if size(CurrectObject, 2) >= threshold
            FINALOBJECT{t} = CurrectObject;
            t = t + 1;
        end
        
        POINTS_NUM = size(POINTS, 2);
        if POINTS_NUM > 0
            initpoint = POINTS(:, 1);
            CurrectObject = initpoint;
        end
    end
    
    % Create the output image with only the filtered objects
    filtered_picture = zeros(size(binary_picture));  % Initialize the output image
    for i = 1:length(FINALOBJECT)
        object_points = FINALOBJECT{i};
        for j = 1:size(object_points, 2)
            filtered_picture(object_points(1, j), object_points(2, j)) = 1;
        end
    end
end

