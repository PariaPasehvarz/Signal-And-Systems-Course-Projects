%Test actuall problem
% [a, b] = p2_4(x, y);
% fprintf('slope: %d\n', a);
% fprintf('y intercept: %d\n', b);

%Create random data 
steps_min = 0;
steps_max = 0.1;
steps = steps_min + (steps_max-steps_min)*rand(1,1);
t = 0:steps:1;

x = 0:steps:1;

params_min = -10;
params_max = 10;
actuall_a = params_min + (params_max-params_min)*rand(1,1);
actuall_b = params_min + (params_max-params_min)*rand(1,1);

fprintf('actuall slope: %d\n', actuall_a);
fprintf('actuall y intercept: %d\n', actuall_b);

y = actuall_a*x + actuall_b;

% Test function without noise
[a, b] = p2_4(x, y);
fprintf('\nTest function without noise\n');
fprintf('estimated slope: %d\n', a);
fprintf('estimated y intercept: %d\n', b);
plot(x, y, 'b')
hold on

% Test function with noise
tlen = length(t);
sigma = 0.05;
y = y + sigma*randn(1, tlen);
[a, b] = p2_4(x, y);
plot(x, y, '.')
fprintf('\nTest function with noise\n');
fprintf('estimated slope: %d\n', a);
fprintf('estimated y intercept: %d\n', b);