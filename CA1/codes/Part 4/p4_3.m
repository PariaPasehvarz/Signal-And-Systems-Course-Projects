function x_changed = p4_3(speed, x)
if speed == 2
    x_changed = x(1:2:end);
elseif speed == 0.5
    x_changed = zeros(1, 2*length(x) - 1); 
    for i = 1:length(x)-1
        x_changed(2*i-1) = x(i);                 
        x_changed(2*i) = (x(i) + x(i+1)) / 2;     
    end
else
    error('speed should be 0.5 or 2!');
end
end