% Scrivere una function in linguaggio Matlab che costruisca una matrice pentadiagonale di
% numeri casuali di dimensione NxN ed effettui le seguenti operazioni:
% - conti quanti elementi della diagonale principale della matrice sono maggiori di 0.5 e restituisca il massimo;
% - restituisca il valore minimo degli elementi sulla prima sottodiagonale.

n = input("Inserisci un numero naturale maggiore di 2: ");

while n < 3
    disp("Errore! Il numero inserito è minore o uguale a 2.");
    n = input("Inserisci un numero naturale maggiore di 2: ");
end

[numEl, maxEl, minSott] = mainn(n);

disp("Elementi diagonale principale > 0.5: " + numEl);
disp("Massimo tra questi elementi: " + maxEl);
disp("Minimo sulla prima sottodiagonale: " + minSott);


function [numEl, maxEl, minSott] = mainn(n)
    % Matrice casuale pentadiagonale
    mat = rand(n,n);
    mat = tril(triu(mat,-2),2);

    % Estrae la diagonale principale
    diagVals = diag(mat);

    % Conta quanti valori > 0.5 e trova il massimo
    mask = diagVals > 0.5;
    numEl = nnz(mask);
    if numEl > 0
        maxEl = max(diagVals(mask));
    else
        maxEl = NaN;  % se nessun elemento soddisfa la condizione
    end

    % Valore minimo della prima sottodiagonale
    minSott = min(diag(mat,-1));

    % Mostra la matrice (solo per debug)
    disp("Matrice generata:")
    disp(mat)
end