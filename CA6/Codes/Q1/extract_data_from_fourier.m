function [t_d, f_d, peek_freq_index] = extract_data_from_fourier(fourier, f_s, f_c)
    fr_range = -f_s/2:1:f_s/2-1;
    positive_frtransform = fourier(:, f_s/2+1:end);
    positive_freq = fr_range(:, f_s/2+1:end);
    [~, peek_freq_index] = max(abs(positive_frtransform));
    f_d_plus_f_c_found = positive_freq(peek_freq_index);
    f_d = f_d_plus_f_c_found - f_c;
    new_phase = angle(positive_frtransform(peek_freq_index));
    t_d = (new_phase) / (-pi*2*f_d_plus_f_c_found);
    peek_freq_index = peek_freq_index + f_s/2;
end