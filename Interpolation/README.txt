Tema a fost implementata in Octave.
Task 1 - Proximal
2x2 - Functia calculeaza x_int si y_int in functie de STEP-ul primit, iar prin intermediul functiei round predefinita in octave calculam cel mai apropiat pixel.
rotate - Folosind inversa matricei T calculam punctele x_p si y_p si le trecem in coordonatele [1, n] adaugand 1 si ne folosim de functia round pentru a afla punctele inconjuratoare, iar cu ajutorul coeficientilor calculati in functia proximal_coef, aflam matricea R pe care o trecem in coordonate [1,n].
resize - Aflam x_p si y_p, iar cu functia round construim matricea R care este trecuta in coordonate [1, n].
RGB - Aflam matricele corespunzatoare culorilor prin img(:, :, x), aplicam functiile cerute pe aceste matrici, iar la final le concatenam folosind comanda cat.

Task 2 - Bicubic
functiile derivate - Calculez functiile derivate cu formulele enuntate.
precalc_d - Construiesc matricele Ix, Iy, Ixy, iar in functie de cerinta pornesc de la indicii corespunzatori.
coef - Formez matricele din enunt, le convertesc cu double si le inmultesc.
resize - Asemanator functiei proximal, aflu x_p si y_p folosind inversa matricei T, gasesc perechile (x1, y1), (x2, y2) folosind comenzile floor si ceil. Convertesc x_p si y_p la patratul unitate, construiesc matricele din enunt ( z si w ) si formez matricea R trecand-o la sistemul de coordonate [1,n].
RGB - Aflam matricele corespunzatoare culorilor prin img(:, :, x), aplicam functiile cerute pe aceste matrici, iar la final le concatenam folosind comanda cat.

Mentionez ca in matricele construite am lucrat cu y in locul lui x si invers, scheletul temei fiind de asa natura.
