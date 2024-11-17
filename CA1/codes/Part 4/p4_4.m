function p4_4(speed, x, sampling_freq)
n = length(x);
original_indices = 1:n;
new_indices = linspace(1, n, round(n / speed));
x_new = interp1(original_indices, x, new_indices, 'linear');
sound(x_new, sampling_freq)
end