function val_threshold = var_threshold(send_message, bitrate, mapset)
    bin_send = str2bin(send_message, mapset);
    signal_send = coding_amp(bin_send, bitrate);
    val_threshold = 2;
    number_step = 0.02;
    for noise = number_step:number_step:2
        for i = 1:50
            signal_noise= noise * randn(size(signal_send));
            signal_receive = signal_send + signal_noise;
            bin_message = decoding_amp(signal_receive, bitrate);
            message_receive = bin2str(bin_message, mapset);
            if ~strcmp(send_message, message_receive)
                val_threshold = noise - number_step;
                return
            end
        end
    end
end