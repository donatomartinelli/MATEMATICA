% 1. Generazione Matrice
A = rand(10) + 100 * diag(ones(1,10));  % Aggiungendo 100 alla diagonale forziamo la dominanza diagonale

% 2. Verifica Funzione
check_Dom = diagDomRow(A)               % Test dominanza (Atteso: 1)
