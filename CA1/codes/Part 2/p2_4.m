function [a, b] = p2_4(x, y)

func = @(params) sum((y-params(1)*x-params(2)).^2, "all");
initial_guess = [0,0];
optimal_params = fminsearch(func, initial_guess);
a = optimal_params(1);
b = optimal_params(2);
end