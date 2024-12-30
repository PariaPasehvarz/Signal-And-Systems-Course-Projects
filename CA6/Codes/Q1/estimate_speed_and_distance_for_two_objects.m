function [found_V1, found_R1, found_V2, found_R2] = estimate_speed_and_distance_for_two_objects(echo_signal_comb, fs, fc, c, betha)
    [found_V1, found_R1, filterd_fourier] = find_and_filter_highest_frq(echo_signal_comb, fs, fc, c, betha);
    [td2, fd2, ~] = extract_data_from_fourier(filterd_fourier, fs, fc);
    found_V2 = fd2/betha;
    found_R2 = td2/2*c;
end