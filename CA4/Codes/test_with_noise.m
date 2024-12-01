function test_with_noise(str, bitrates, noise, mapset)
    bin_send = str2bin(str, mapset);

    num_bitrates = length(bitrates);
    result = cell(num_bitrates, 1);

    for idx = 1:num_bitrates
        bitrate = bitrates(idx);

        signal_send = coding_amp(bin_send, bitrate);

        noisy_signal = signal_send + noise * randn(size(signal_send));

        bin_receive = decoding_amp(noisy_signal, bitrate);

        str_receive = bin2str(bin_receive, mapset);

        result{idx} = sprintf('Received (bitrate=%d, noise=%.2f): %s', bitrate, noise, str_receive);
    end

    for i = 1:num_bitrates
        disp(result{i});
    end
end
