% 1. Costruzione Matrice
n = 15;
A = -tril(ones(n),-1) + 100 * eye(n);

% 2. Verifica Dominanza
check_Row = diagDomRow(A) % Test dominanza (Atteso: 1)
check_Col = diagDomCol(A) % Test dominanza (Atteso: 1)
