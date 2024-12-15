function is_corrupted = check_message_with_noise(signal_send, noise, bitrate, mapset, original_str)
    for i = 1:100
        signal_receive = signal_send + noise * randn(size(signal_send));
        bin_receive = decoding_freq(signal_receive, bitrate);
        str_receive = binary_to_message(bin_receive, mapset);
        if ~strcmp(original_str, str_receive)
            is_corrupted = true;
            return;
        end
    end
    is_corrupted = false;
end

