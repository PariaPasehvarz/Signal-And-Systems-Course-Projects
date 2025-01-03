clc;
clear;
close all;

ts = 1e-9;
tau = 1e-6;
R = 450;
alpha = 0.5;
C = 3e8;

td = 2*R/C;
fs=1/ts;

T = 0:ts:1e-5;
Tlen = length(T);

td_steps = (td/1e-5)*(Tlen-1);
tau_steps = ((td+tau)/1e-5)*(Tlen-1);

x = zeros(1,Tlen);
x(fix(td_steps+1):fix(tau_steps)) = 0.5 * ones(fix(tau_steps - td_steps), 1);
N = fix(tau_steps - td_steps);

sigma = 0.02:0.02:4;
errors = zeros(size(sigma));
for idx = 1: numel(sigma)
    errors(idx) = get_noise_error(sigma(idx), x, Tlen, ts, N);
end

% Plotting
figure;
plot(sigma, errors, 'b')
title('Errors over different values of noises');
xlabel('Noise')
ylabel('Error')
grid on
