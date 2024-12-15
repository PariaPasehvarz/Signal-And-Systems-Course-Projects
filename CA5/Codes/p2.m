%%
clear
close all
clc

%% LOADING MAPSET

load('mapset.mat')
char_bin_len = length(mapset{2, 1});

%% CODE MESSAGE WITH DIFFERENT BITRATES

fs = 100; 
str = 'signal';

bin = message_to_binary(str, mapset);

bitrates = [1, 5];

num_bitrates = length(bitrates);
for i = 1:num_bitrates
    bitrate = bitrates(i);
    x = coding_freq(bin, bitrate); 

    t = 0:(1 / fs):(length(str) * char_bin_len / bitrate - 1 / fs);
    figure;
    plot(t, x);
    title(['Bitrate = ', num2str(bitrate)]);
    xlabel('Time (s)');
    ylabel('Amplitude');
end

grid on;

%% DEODING SIGNAL MESSAGE WITH DIFFERENT BITRATES, WIITHOUT NOISE

str = 'signal';
bitrates = [1, 5];
decoding_without_noise(str, bitrates, mapset);

%% DEODING SIGNAL MESSAGE WITH DIFFERENT BITRATES, WIITH NOISE

str = 'signal';
bitrates = [1, 5];
noise = 0.01;
decoding_with_noise(str, bitrates, noise, mapset);

%% DEODING SIGNAL MESSAGE WITH DIFFERENT BITRATES, WIITH DIFFERENT NOISES   

send_message = 'signal';
bitrates = [1, 5];

noise = 0.1;
decoding_with_noise(send_message, bitrates, noise, mapset);
fprintf('\n')

noise = 0.4;
decoding_with_noise(send_message, bitrates, noise, mapset);
fprintf('\n')

noise = 0.7;
decoding_with_noise(send_message, bitrates, noise, mapset);
fprintf('\n')

noise = 1;
decoding_with_noise(send_message, bitrates, noise, mapset);
fprintf('\n')

noise = 1.2;
decoding_with_noise(send_message, bitrates, noise, mapset);
fprintf('\n')

noise = 1.5;
decoding_with_noise(send_message, bitrates, noise, mapset);
fprintf('\n')

noise = 1.8;
decoding_with_noise(send_message, bitrates, noise, mapset);
fprintf('\n')

%% FIND NOISE THRESHOLD FOR EACH BITRATE

bitrates = [1, 5];

num_bitrates = length(bitrates);
for i = 1:num_bitrates
    threshold = find_noise_threshold(str, bitrates(i), mapset);
    disp(['Noise threshold (bitrate=', num2str(bitrates(i)), '): ', num2str(threshold)])
end