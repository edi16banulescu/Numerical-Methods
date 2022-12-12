function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out

    fisier_iesire = strcat(nume,".out");
    file_in = fullfile(nume);
    file_out = fopen(fisier_iesire, "w");
    
    matrice = dlmread(file_in);
    N = matrice(1,1);

    R1 = Iterative(nume, d, eps);
    R2 = Algebraic(nume, d);
    fprintf(file_out, "%d\n", N);
    fprintf(file_out, "%.6f\n", R1);
    fprintf(file_out, "\n");
    fprintf(file_out, "%.6f\n", R2);
    fprintf(file_out, "\n");

    % -> ordonam descrescator vectorul R2 si ii calculam apartenenta
    [PR1 index] = sort(R2, 'descend');
    val1 = matrice(N+2, 1);
    val2 = matrice(N+3, 1);
    
    for i = 1:N
        u(i) = Apartenenta(PR1(i), val1, val2);
    end

    for i = 1:N
        fprintf(file_out,"%d %d %.6f\n", i, index(i), u(i));
    end
end
