function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
    if x < val1
        y = 0
    end

    % -> calculam limitele laterale si rezulta formula
    if x >= val1 && x <= val2
        y = (x - val1) / (val2 - val1);
    end
    
    if x > val2
            y = 1
    end
    
end


	