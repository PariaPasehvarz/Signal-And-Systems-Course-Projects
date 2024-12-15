function decoding_without_noise(str, bitrates, mapset)
bin_send = message_to_binary(str, mapset);
    result = cell(length(bitrates), 1);

    for i = 1:length(bitrates)
        bitrate = bitrates(i);
        signal_send = coding_freq(bin_send, bitrate);
        bin_receive = decoding_freq(signal_send, bitrate);
        str_receive = binary_to_message(bin_receive, mapset);
        result{i} = ['Recieved (bitrate=', num2str(bitrate),'): ', str_receive];
    end

    for i = 1:length(result)
        disp(result{i})
    end
end