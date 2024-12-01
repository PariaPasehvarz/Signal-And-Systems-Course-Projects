function signal = coding_amp(bin_msg, bitrate)
    fs = 100; 
    bin_split = transpose(reshape(bin_msg, bitrate, [])); 

    coeffs = linspace(0, 1, pow2(bitrate)); 
    t = 0:1/fs:1 - 1/fs;
    num_segments = size(bin_split, 1); 
    signal_parts = zeros(num_segments, fs); 

    for i = 1:num_segments
        bin_value = bin_split(i, :); 
        coeff = coeffs(bin2dec(bin_value) + 1); 
        signal_parts(i, :) = coeff * sin(2 * pi * t); 
    end

    signal = reshape(signal_parts', 1, []); 
end
