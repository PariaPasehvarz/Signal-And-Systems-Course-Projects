t = 0:0.01:1;
z1 = sin(2*pi*t);
z2 = cos(2*pi*t);

subplot(1,2,1)
plot(t, z1, '--b')
x0 = 0.5;
y0 = 0.2;
s = 'sin(2 \pi t)';
text(x0, y0, s);
title('Sin');
legend('sin')
xlabel('time')
ylabel('amplitude')
grid on

subplot(1,2,2)
plot(t, z2, 'r')
x0 = 0.25;
y0 = -0.8;
s = 'cos(2 \pi t)';
text(x0, y0, s);
title('Cos');
legend('cos')
xlabel('time')
ylabel('amplitude')
grid on
