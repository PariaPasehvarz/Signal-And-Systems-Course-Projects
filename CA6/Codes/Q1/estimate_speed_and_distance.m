function [estimated_V, estimated_R] = estimate_speed_and_distance(y_t, f_s, f_c, c, betha)
    [t_d , f_d, ~, ~] = find_t_and_f_dopler(y_t, f_s, f_c);
    estimated_R = t_d/2*c;
    estimated_V = f_d/betha;
end