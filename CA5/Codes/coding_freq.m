function coded_signal = coding_freq(binary_msg, bitrate)

    fs = 100;
    freq_map = {[12, 37], ...
                [5, 16, 27, 38], ...
                [4, 10, 16, 22, 28, 34, 40, 46], ...
                [2, 5, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35, 38, 41, 44, 47], ...
                [1, 2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20, 22, 23, ...
                 25, 26, 28, 29, 31, 32, 34, 35, 37, 38, 40, 41, 43, 44, 46, 47]};

    frequencies = cell2mat(freq_map(bitrate));
    signal_length = length(binary_msg);
    num_segments = signal_length / bitrate;
    decoded_values = zeros(1, num_segments);
    coded_signal = [];

    for idx = 1:bitrate:signal_length
        segment_idx = (idx - 1) / bitrate + 1;
        binary_segment = binary_msg(idx:idx + bitrate - 1);
        decoded_values(segment_idx) = bin2dec(num2str(binary_segment));
        time_step = (segment_idx - 1):1/fs:segment_idx - 1/fs;
        freq_signal = sin(2 * pi * frequencies(decoded_values(segment_idx) + 1) * time_step);
        coded_signal = [coded_signal, freq_signal];
    end
end

