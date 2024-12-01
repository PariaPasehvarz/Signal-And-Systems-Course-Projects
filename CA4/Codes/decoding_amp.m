function binary = decoding_amp(signal, bitrate)
    fs = 100; 
    parts_count = length(signal) / fs; 
    binary = blanks(parts_count * bitrate); 

    signal_parts = transpose(reshape(signal, fs, parts_count));

    t = 0:1/fs:1 - 1/fs;
    reference_signal = 2 * sin(2 * pi * t); 

    for i = 1:parts_count
        current_part = signal_parts(i, :);

        current_part = min(max(current_part, -1), 1);

        corr_integral = trapz(current_part .* reference_signal) / fs;
        corr_integral = abs(corr_integral);

        closest = round(corr_integral * (pow2(bitrate) - 1));
        binary_value = dec2bin(closest, bitrate);

        binary(bitrate * (i - 1) + 1:bitrate * i) = binary_value;
    end
end
