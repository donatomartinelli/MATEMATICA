% Scrivere una function in linguaggio Matlab che preveda in input un vettore v di lunghezza N e un intero K<=N ed effettui le seguenti operazioni:
% - costruisca la matrice quadrata che ha la diagonale principale, la K-sima riga e la K-esima colonna coincidenti con v e tutti gli altri elementi uguali a 2;
% - conti quanti elementi della matrice sono inferiori alla media degli elementi della matrice;
% - restituisca il valore della media e il numero di elementi di valore inferiore.

% Vettore di input e indice K
v = [1 9 3 4 5];
k = 3;

% Richiamo della funzione
[media, elemInf] = func(v, k);

media 
elemInf

function [media, elemInf] = func(vec, k)
    n = length(vec);

    % Controllo validità dell'indice k
    if k < 0 || k > n 
        error("k è minore di zero o maggiore di n.")
    end

    % Inizializza matrice n×n con tutti elementi uguali a 2
    A = ones(n) + ones(n);

    % Imposta la diagonale principale, la k-esima riga e colonna uguali a vec
    A(1 : n + 1 : end) = vec;
    A(:, k) = vec;
    A(k, :) = vec;

    % Calcola la media degli elementi della matrice
    media = mean(A(:));

    % Conta quanti elementi sono inferiori alla media
    mask = A < media;
    elemInf = sum(mask(:));
end
