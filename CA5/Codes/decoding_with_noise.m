function result = decoding_with_noise(str, bitrates, noise, mapset)
    bin_send = message_to_binary(str, mapset);
    result = cell(length(bitrates), 1);

    for i = 1:length(bitrates)
        bitrate = bitrates(i);
        signal_send = coding_freq(bin_send, bitrate);
        signal_receive = signal_send + noise * randn(size(signal_send));
        bin_receive = decoding_freq(signal_receive, bitrate);
        str_receive = binary_to_message(bin_receive, mapset);
        result{i} = ['Recieved (bitrate=', num2str(bitrate), ', noise=', num2str(noise), '): ', str_receive];
    end

    for i = 1:length(result)
        disp(result{i})
    end
end
