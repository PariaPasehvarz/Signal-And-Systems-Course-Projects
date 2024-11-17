[x, sampling_freq] = audioread("Recording.wav");
x_changed = p4_3(2, x);
sound(x_changed, sampling_freq)