function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

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
    
    % -> din formula iterativa scoatem R si rezulta formula
    R = PR_Inv(eye(N) - d * M) * (((1-d) / N) * columnVector);
end
    
