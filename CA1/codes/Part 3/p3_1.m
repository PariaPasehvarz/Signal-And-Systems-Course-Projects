ts = 1e-9;
tau = 1e-6;
fs=1/ts;

T = 0:ts:1e-5;
Tlen=length(T);

steps = (tau/1e-5)*(Tlen-1);

x = zeros(1,Tlen);
x(1:steps) = ones(fix(steps), 1);

plot(T,x,'LineWidth',4)
ylim([0 1.5])