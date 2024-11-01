function x_rc = linecoding_raisedcos(t,Tb,beta)
    p_rc = @(t) (sin(pi*t/Tb) ./ (pi*t/Tb)) .* (cos(beta*pi*t/Tb) ./ (1 - (2*beta*t/Tb).^2));
    p_rc = @(t) (t >= 0 & t <= Tb) .* p_rc(t);
        
    %line coding with raised cosine pulse
    x_rc = zeros(size(t));
    for k = 1:size(t)
        x_rc = x_rc + p_rc(t - (k-1)*Tb);
    end
end