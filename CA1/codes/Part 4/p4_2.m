[x, sampling_freq] = audioread("Recording.wav");

% listening to audiofile
sound(x, sampling_freq);

% save x as a wav file
audiowrite("x.wav", x, sampling_freq)

% plot signal
figure;
t = seconds(0:1/sampling_freq:(size(x,1)-1)/sampling_freq);
plot(t, x, 'b')
title('Recorded voice signal over time');
xlabel('Time')
ylabel('Amplitude')
grid on