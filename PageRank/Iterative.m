function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

    % -> citim din fisierul "nume" sub forma unei matrice

    file = fullfile(nume);
    matrice = dlmread(file);
    N = matrice(1, 1);
    M = zeros(N, N);

    % -> construim matricea M din formula
    for i = 1:N
        Numar_linkuri = matrice(i + 1, 2);
        Links = Numar_linkuri;
        for j = 3:(Numar_linkuri + 2)
            if(matrice(i + 1, j) == matrice(i + 1, 1))
                Links = Links - 1;
                break;
            end
        end

        for j = 3:(Numar_linkuri + 2)
            if(matrice(i + 1, j) ~= matrice(i + 1, 1))
                index = matrice(i + 1, j);
                M(i, index) = 1 / Links;
            end
        end
    end

    % -> initializam R la pasul t = 0
    R(1:N) = 1 / N;
    columnVector = ones(N, 1);
    R = R';
    M = M';
    % -> efectuam algoritmul cel putin odata
    Rnext = d * M * R + ((1-d) / N) * columnVector;
    
    % -> continuam algoritmul pana |R - Rnext| < eps
    while norm(R - Rnext) > eps
        Rnext = R;
        R = d * M * R + ((1-d) / N) * columnVector;
    end
    
    R = Rnext;
end










