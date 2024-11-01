function x_rect = linecoding_rectpulse(t,Tb)
    p_rect = @(t)(t>=0 & t<Tb);
    
    % Line coding using rectangular pulses
    x_rect = zeros(size(t));
    for k = 1:size(t)
        x_rect = x_rect + p_rect(t-(k-1)*Tb);
    end  
end