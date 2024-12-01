function check_properties(noise)

figure;
histogram(noise, 'Normalization', 'pdf');
hold on;
x = linspace(min(noise), max(noise), 100);
y = normpdf(x, 0, 1); 
plot(x, y, 'r', 'LineWidth', 2);
title('Histogram of Noise with Normal Distribution Curve');
xlabel('Value');
ylabel('Probability Density');
legend('Noise Histogram', 'Normal Distribution');
hold off;

mean_noise = mean(noise);
fprintf('Mean of the noise: %.4f\n', mean_noise);

variance_noise = var(noise);
fprintf('Variance of the noise: %.4f\n', variance_noise);
end