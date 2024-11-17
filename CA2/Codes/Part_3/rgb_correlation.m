function [corr_max, bound_box] = rgb_correlation (template, pic)
%% SEPERATE THE CHANNELS AND CALCULATE THE CROSS CORRELATION
    corrRed = normxcorr2(template(:, :, 1), pic(:, :, 1));
    corrGreen = normxcorr2(template(:, :, 2), pic(:, :, 2));
    corrBlue = normxcorr2(template(:, :, 3), pic(:, :, 3));
    corr_sum = (corrRed + corrGreen + corrBlue);
    corr_mix = corr_sum / 3;
%% FIND THE MAX INDEX AND VALUE
    [corr_max, corrIndex] = max(abs(corr_mix(:)));
    [max_Y, max_X] = ind2sub(size(corr_mix), corrIndex(1));
    left_corner_X= max_X - size(template, 2);
    left_corner_Y= max_Y - size(template, 1);
    corr_place = [left_corner_X,left_corner_Y];
%% FORM THE BOUNDING BOX
    bound_box = [corr_place(1), corr_place(2), size(template, 2), size(template, 1)];
end