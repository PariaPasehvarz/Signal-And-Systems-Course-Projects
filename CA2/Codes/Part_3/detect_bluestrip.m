function bounding_box = detect_bluestrip(picture_full)
%% LOAD AND FIND BLUESTRIP
    bluestrip = imread('bluestrip.png');
    picture = imresize(picture_full, [NaN, 800]);
    ratio = size(picture_full, 1) / size(picture, 1);
    load ARM;
    [corr_max, bound_box] = rgb_correlation(bluestrip, picture);
%% FIND THE MAX VALUE FOR CORRELATION
    blue_arms = size(blue_arm, 2);
    for k = 1:blue_arms
          [corr_max2, bbox2] = rgb_correlation(blue_arm{1,k}, picture);
          if corr_max2>corr_max
           [corr_max, bound_box] = rgb_correlation(blue_arm{1,k}, picture);
           end
    end
%% FIX THE BOUNDING BOX
     error_domain = 10;
     bound_box_pre = [round((bound_box(1) - error_domain) * ratio), round((bound_box(2) - error_domain) * ratio),...
                round((bound_box(3) + 2 * error_domain) * ratio),round((bound_box(4) + 2 * error_domain) * ratio)];

    bounding_box = bound_box_pre;
    BLUE2PLATE_RATIO = 14;
    bounding_box(3) = BLUE2PLATE_RATIO * bound_box(3) * ratio;
%% CHECK THE VALUE OF CORRELATION
    if corr_max < 0.45
        bounding_box = [];
    end
end


