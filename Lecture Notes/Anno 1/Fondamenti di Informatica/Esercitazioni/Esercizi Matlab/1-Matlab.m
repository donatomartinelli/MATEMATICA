% Scrivere una function in linguaggio Matlab che preveda in input un vettore ed effettui le seguenti operazioni:
% - costruisca la matrice quadrata "a freccia" che ha l'ultima riga, l'ultima colonna e la diagonale coincidenti con il vettore di input;
% - calcoli la somma degli elementi non nulli della matrice;
% - restituisca la somma calcolata e la matrice.

v = [1 1 2 1];                                          % Definizione del vettore di input

[sum, mat] = matFreccia(v);                             % Chiamata della funzione "matFreccia" che restituisce la matrice e la somma

mat                                                     % Stampa della matrice risultante
disp("Sum of Non-zero elements of the matrix: " + sum)  % Visualizzazione della somma calcolata


% ----------------------- FUNZIONE -----------------------
function [somma, matrice] = matFreccia(vettore)

    n = length(vettore);       % Calcolo della dimensione del vettore
    mat = zeros(n);            % Creazione di una matrice quadrata n x n di zeri
    sum = 0;                   % Inizializzazione della variabile somma

    mat(n,:) = vettore;        % Inserimento del vettore nell'ultima riga
    mat(:,n) = vettore;        % Inserimento del vettore nell'ultima colonna
    mat(1:n+1:end) = vettore;  % Inserimento del vettore sulla diagonale principale

    % Scansione di tutta la matrice
    for i = 1:1:n 
        for j = 1:1:n 
            % Se l'elemento non è zero, viene aggiunto alla somma
            if (mat(i,j) ~= 0)
                sum = sum + mat(i,j);
            end
        end
    end

    % Assegnazione degli output della funzione
    somma = sum;
    matrice = mat;
end
