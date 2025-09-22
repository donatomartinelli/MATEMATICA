% Scrivere una function in linguaggio Matlab che preveda in input un vettore di lunghezza N ed un intero K<=N ed effettui le seguenti operazioni:
% - costruisca la matrice quadrata che abbia tutte le colonne pari coincidenti con il vettore e gli altri elementi uguali ad 1;
% - calcoli la somma degli elementi della sottomatrice principale di ordine K (costituita dalle prime K righe e K colonne);
% - restituisca la somma calcolata e la matrice.

v = [1 2 3 4 5 6 7 8 9 9];   % vettore di esempio
K = 6;                       % intero scelto (K <= length(v))

[somma, mat] = somMin(v, K); % chiamata della funzione

somma                        % stampa la somma
mat                          % stampa la matrice


function [somma, mat] = somMin(vec, K)

    n = length(vec);   % dimensione del vettore

    % Validazione input: K deve essere compreso tra 0 e n
    if K < 0 || K > n
        error("Errore! K deve essere compreso tra 0 e " + n);
    end

    A = ones(n);       % matrice n×n inizializzata a 1
    
    % Inserisce il vettore nelle colonne pari
    for i = 2:2:n 
        A(:,i) = vec;
    end

    % Estrae la sottomatrice principale K×K
    B = A(1:K,1:K);

    % Output
    mat = A;               % la matrice completa
    somma = sum(B(:));     % somma degli elementi della sottomatrice
end
