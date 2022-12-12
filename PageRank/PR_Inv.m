function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare
    % -> Aflu matricele Q R folosind Gram Schmidt
    [~, n] = size(A);
    Q = zeros(n,n);
    R = zeros(n,n);
    V = A;
    for i = 1:n
        R(i,i) = norm(V(:,i));
        Q(:,i) = V(:,i) / R(i,i);
        for j = i+1 : n
            R(i,j) = Q(:,i)' * V(:,j);
            V(:,j) = V(:,j) - R(i,j) * Q(:, i);
        end
    end
    
    
    % -> rezolv R * x = Q * b cu SST

    B = zeros(n, n);
    I = eye(n, n);

    for i = 1:n
        b = Q' * I(1:n, i);
        B(1:n, i) = SST(R, b);
    end
end


    