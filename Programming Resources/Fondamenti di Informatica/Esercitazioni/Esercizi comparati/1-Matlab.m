% Scrivere una function in linguaggio Matlab che preveda in input un vettore ed effettui le seguenti operazioni:
% - costruisca la matrice quadrata "a freccia" che ha la prima riga, la prima colonna e la diagonale coincidenti con il vettore di input;
% - calcoli il minimo degli elementi positivi della matrice;
% - restituisca il minimo calcolato e la matrice.

function [minimo, B] = arrMatMin(A)
    % arrMatMin - Costruisce una matrice a freccia da un vettore e
    % restituisce il minimo degli elementi positivi della matrice
    % 
    % Sintassi:
    %   [minimo, B] = arrMatMin(A)
    %
    % Input:
    %   A - Vettore riga o colonna
    %
    % Output:
    %   minimo - minimo degli elementi positivi della matrice
    %   B      - matrice quadrata "a freccia"

    n = length(A);        % dimensione del vettore
    B = zeros(n);         % inizializza matrice n×n

    % costruzione matrice a freccia
    B(:,1) = A;           % prima colonna
    B(1,:) = A;           % prima riga
    B(1:n+1:end) = A;     % diagonale principale

    % calcolo minimo degli elementi positivi
    if any(B(:) > 0)
        minimo = min(B(B > 0));
    else
        minimo = []; % se non ci sono positivi, restituisco vuoto
    end
end
