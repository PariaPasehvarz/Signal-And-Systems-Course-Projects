function test_without_noise(str, bitrates, mapset)
    bin_send = str2bin(str, mapset);

    num_bitrates = length(bitrates);
    result = cell(num_bitrates, 1);

    for idx = 1:num_bitrates
        bitrate = bitrates(idx);

        signal_send = coding_amp(bin_send, bitrate);
        bin_receive = decoding_amp(signal_send, bitrate);

        str_receive = bin2str(bin_receive, mapset);

        result{idx} = sprintf('Received (bitrate=%d) Received message: %s', bitrate, str_receive);
    end

    for i = 1:num_bitrates
        disp(result{i});
    end
end
