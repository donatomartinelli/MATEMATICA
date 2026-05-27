% 1. Generazione Matrice
R = rand(10);      % Matrice casuale di partenza
A = R * R';        % La moltiplicazione A*A' garantisce una matrice Simmetrica e Def. Positiva

% 2. Verifica Funzioni
check_Sym = isSymm(A)   % Test simmetria (Atteso: 1)
check_Pos = isDefPos(A) % Test Sylvester (Atteso: 1)
