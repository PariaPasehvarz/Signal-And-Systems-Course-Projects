function thold = find_noise_threshold(str, bitrate, mapset)
    bin_send = message_to_binary(str, mapset);
    signal_send = coding_freq(bin_send, bitrate);

    thold = 2;
    nStep = 0.02;

    noise_values = nStep:nStep:2;
    for noise = noise_values
        if check_message_with_noise(signal_send, noise, bitrate, mapset, str)
            thold = noise - nStep;
            return
        end
    end
end

