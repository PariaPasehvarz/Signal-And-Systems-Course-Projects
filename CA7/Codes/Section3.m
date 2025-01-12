syms y(t)
eqn = diff(y,t,2) + 3*diff(y,t) + 2*y == 5; % Define the differential equation
cond1 = y(0) == 1; % Initial condition for y(0)
cond2 = Dy(0) == 1; % Initial condition for y'(0)

ySol(t) = dsolve(eqn, cond1, cond2); % Solve the differential equation

% Simplify the solution
ySol(t) = simplify(ySol(t))

% Plot the solution
fplot(ySol, [0, 10]) % Adjust the time interval as needed
grid on
xlabel('Time (t)')
ylabel('y(t)')
title('Solution of the Differential Equation')