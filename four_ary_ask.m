function list = four_ary_ask(data)
    list = [];

    % Encoding
    for i = 1:2:length(data)-1
        a = data(i); 
        b = data(i+1);
        if (a == '0') && (b == '0')
            list = [list 0];
        elseif (a == '0') && (b == '1')
            list = [list 1];
        elseif (a == '1') && (b == '0')
            list = [list 2];
        else % (a == '1') && (b == '1')
            list = [list 3];
        end
    end

    % Line Coding
    raised_cosine = linecoding_raisedcos(t,)
end