fs = 50;
time_start=-1;
time_end=1;
steps=1/fs;
t = time_start:steps:time_end - steps;
N = length(t);
f = (-fs / 2):(fs / N):(fs / 2 - fs / N);

x1 = cos(2 * pi * 5 * t);
figure()
plot(t, x1)
xlabel('Time (s)')
ylabel('x_1')
title('cos(10\pi t)')

y1 = fftshift(fft(x1));
magnitude=abs(y1) / max(abs(y1));
figure()
plot(f, magnitude)
xlabel('Frequency (Hz)')
ylabel('y_1')
title('FFT(x_1)')