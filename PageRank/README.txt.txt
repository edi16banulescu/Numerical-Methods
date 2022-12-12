Am implementat algoritmul PageRank in Matlab. 
In functia Iterative aplicam algoritmul aflat pe Wikipedia, respectiv citim cu dlmread sub
forma de matrice fisierul "nume", apoi calculam matricea M direct, iar apoi R(t+1) pana cand
(R - Rnext) < eps.
In functia Algebraic, scoatem din algoritm o formula generala pentru R.
In functia PR_Inv, aplicam algoritmul GramSchmidt pentru a transforma o matrice in QR, iar
apoi cu ajutorul functiei SST ( rezolvarea unui sistem superior triunghiular ) rezolvam
sistemul T · xi = ei.
In functia Apartenenta, calculam apartenenta unei pagini cu ajutorul limitelor laterale.
In functia PageRank, afisam in fisierul "nume".out rezultatele functiilor in ordinea ceruta.