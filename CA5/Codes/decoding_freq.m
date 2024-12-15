function decoded_signal = decoding_freq(signal, bitrate)
    fs = 100;
    ts = 1 / fs;
    N = 1 / ts;
    freq_map = {[12, 37], ...
                [5, 16, 27, 38], ...
                [4, 10, 16, 22, 28, 34, 40, 46], ...
                [2, 5, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35, 38, 41, 44, 47], ...
                [1, 2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20, 22, 23, ...
                 25, 26, 28, 29, 31, 32, 34, 35, 37, 38, 40, 41, 43, 44, 46, 47]};

    frequencies = freq_map{bitrate};
    signal_length = length(signal);
    decoded_signal = [];

    for start_idx = 1:fs:signal_length
        segment = signal(start_idx:start_idx + fs - 1);
        normalized_fft = abs(fftshift(fft(segment)) / max(abs(fft(segment))));
        freq_indices = arrayfun(@(freq) ...
            normalized_fft(round(fs / 2 * fs / N - freq * fs / N + 1)), frequencies);
        [~, max_idx] = max(freq_indices);
        decoded_signal = [decoded_signal, dec2bin(max_idx - 1, bitrate)];
    end
end

