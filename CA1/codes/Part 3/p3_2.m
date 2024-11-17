ts = 1e-9;
tau = 1e-6;
R = 450;
alpha = 0.5;
C = 3e8;

td = 2*R/C;
fs=1/ts;

T = 0:ts:1e-5;
Tlen=length(T);

td_steps = (td/1e-5)*(Tlen-1);
tau_steps = ((td+tau)/1e-5)*(Tlen-1);

x = zeros(1,Tlen);
x(fix(td_steps+1):fix(tau_steps)) = 0.5 * ones(fix(tau_steps - td_steps), 1);

plot(T,x,'LineWidth',4)
ylim([0 1.5])