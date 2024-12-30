function [found_V1, found_R1, filterd_fourier] = find_and_filter_highest_frq(echo_signal_comb, fs, fc, c , betha)
    [td1, fd1, foureier, peek_indx] = find_t_and_f_dopler(echo_signal_comb, fs, fc);
    foureier(1, peek_indx) = 0;
    filterd_fourier = foureier;
    found_V1 = fd1/betha;
    found_R1 = td1/2*c;
end
