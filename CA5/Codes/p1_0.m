fs = 20;
time_start=0;
time_end=1;
step=1/fs;
t = time_start:steps:time_end - steps;
N = length(t);
f = 0:(fs / N):((N - 1) * fs / N);

x1 = exp(1j * 2 * pi * 5 * t) + exp(1j * 2 * pi * 8 * t);
x2 = exp(1j * 2 * pi * 5 * t) + exp(1j * 2 * pi * 5.1 * t);
y1 = fft(x1);
y2 = fft(x2);
magnitude_1=abs(y1) / max(abs(y1));
magnitude_2=abs(y2) / max(abs(y2));

figure()
plot(f,magnitude_1)
xlabel('Freq')
ylabel('y_1')
title('FFT(x_1)')

figure()
plot(f, magnitude_2)
xlabel('Freq')
ylabel('y_2')
title('FFT(x_2)')
