function [mean_error] = get_noise_error(sigma, x, Tlen, ts, N)
C = 3e8;
error = 0;
for i = 1:100
    s = 0.5 * ones(1,N);
    noise = sigma*randn(1,Tlen);
    
    new_x = x + noise;
    
    for j=1:Tlen-N
        ro(j)=dot(new_x(j:j+N-1),s);
    end

    [val,ind]=max(ro);

    td2=(ind-1)*ts;
    R2=C*td2/2;
    error = error + abs(R2-450);
end
mean_error = error / 100;
end