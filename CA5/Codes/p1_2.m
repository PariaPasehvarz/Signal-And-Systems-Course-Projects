fs = 100;
time_start=0;
time_end=1;
steps=1/fs;
t = time_start:steps:time_end - steps;
N = length(t);
f = 0:(fs / N):((N - 1) * fs / N);

x2 = cos(2 * pi * 15 * t + 0.25 * pi);
figure()
plot(t, x2)
xlabel('Time (s)')
ylabel('x_2')
title('cos(30\pi t+\pi/4)')

y2 = fft(x2);
magnitude= abs(y2) / max(abs(y2));
figure()
plot(f,magnitude)
xlabel('Frequency (Hz)')
ylabel('y_2')
title('FFT(x_2)')

smallValue = 1e-6;
y2(abs(y2) < smallValue) = 0;
theta2 = angle(y2);
figure()
plot(f, theta2 / pi)
xlabel('Frequency (Hz)')
ylabel('\theta_2/\pi')
title('Phase of FFT(x_2)')

