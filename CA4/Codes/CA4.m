%%
clear
close all
clc

%% CREATE MAPSET AND LOAD IT 
create_mapset();
load('mapset.mat')
mapset_len = length(mapset{2, 1});

%% SEND SIGNAL WITH BITRATE 1, 2, 3 FOR CODING
fs = 100;
send_message = 'signal';
bin = str2bin(send_message, mapset);

for bitrate = 1:3
    x = coding_amp(bin, bitrate);
    t = 0:(1 / fs):(length(send_message) * mapset_len / bitrate - 1 / fs);

    figure;
    plot(t, x)
    title(['Bitrate = ', num2str(bitrate)])
end

%% DECODE SIGNAL WITH BITRATE 1, 2, 3
send_message = 'signal';
bitrates = 1:3;
test_without_noise(send_message, bitrates, mapset);

%% CHECK NOISE PROPERTIES
noise = randn(1, 3000);
check_properties(noise)

%% TEST CODING AND DECODING FOR A SIGNAL WITH NOISE 0.0001
send_message = 'signal';
bitrates = 1:3;
noise = 0.01;
disp("With noise 0.0001");
p1_6(send_message, bitrates, noise, mapset);

%% TEST CODING AND DECODING FOR MULTIPLE VALUES OF NOISE
send_message = 'signal';
bitrates = 1:3;

noise = 0.1;
test_with_noise(send_message, bitrates, noise, mapset);
fprintf('\n')

noise = 0.4;
test_with_noise(send_message, bitrates, noise, mapset);
fprintf('\n')

noise = 0.7;
test_with_noise(send_message, bitrates, noise, mapset);
fprintf('\n')

noise = 1;
test_with_noise(send_message, bitrates, noise, mapset);
fprintf('\n')

noise = 1.2;
test_with_noise(send_message, bitrates, noise, mapset);
fprintf('\n')

%%    Thereshold For Variance
send_message = 'signal';
for bitrate = 1:3
    var_hold = var_threshold(send_message, bitrate, mapset);
    fprintf("the threshold is %.4f for bitrate %d\n",var_hold,bitrate)
end



