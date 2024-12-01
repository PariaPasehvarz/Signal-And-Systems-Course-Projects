function p1_6(str, bitrates, noise, mapset)
bin_send = str2bin(str, mapset); 
for i = 1:length(bitrates)
    bitrate = bitrates(i);
    signal_send = coding_amp(bin_send, bitrate);
    noise_signal=noise* randn(size(signal_send));
    signal_receive = signal_send +noise_signal;
    bin_message = decoding_amp(signal_receive, bitrate);
    message_receive = bin2str(bin_message, mapset);
    fprintf("the bitrate is %d with noise is resulted: %s\n",bitrate,message_receive)
end
end
