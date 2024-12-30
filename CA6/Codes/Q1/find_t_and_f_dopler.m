function [td ,fd, fourier, peek_freq_index] = find_t_and_f_dopler(echo_signal, fs, fc)
    fourier = fftshift(fft(echo_signal));
    [td, fd, peek_freq_index] = extract_data_from_fourier(fourier, fs, fc);
end
