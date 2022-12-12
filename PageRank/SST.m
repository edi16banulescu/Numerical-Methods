function x = SST(A, b)
    % -> rezolvarea unui sistem superior triunghiular
    [~,n] = size(A);
    x = zeros(n,1);
    x(n) = b(n) / A(n, n);
    % -> aplicam formula din laborator
    for i = n-1:-1:1
        x(i) = ( b(i) - A(i, i+1:n) * x(i+1:n) ) / A(i,i);
    end
end