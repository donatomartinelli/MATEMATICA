% Scrivere una function in linguaggio Matlab che preveda in input due vettori x e y di uguale lunghezza ed effettui le seguenti operazioni:
% - costruisca la matrice quadrata che ha le righe dispari coincidenti con x, e quelle pari coincidenti con y;
% - calcoli la media degli elementi delle colonne pari;
% - restituisca la media calcolata e la matrice.

x = [1 0 3 4 -1 6 8];
y = [5 6 7 8 0 -1 -5];


[med, mat] = parDisp(x,y);

med
mat

function [media, matrice] = parDisp(vec1, vec2)

    n = length(vec1);    % Lunghezza dei vettori (uguali per ipotesi)
    
    matrice = zeros(n);  % Inizializza matrice n×n di zeri
    
    % Costruzione della matrice
    for i = 1 : n
        if mod(i,2) ~= 0
            matrice(i,:) = vec1;   % Riga dispari → copio vec1
        else 
            matrice(i,:) = vec2;   % Riga pari → copio vec2
        end
    end
    
    % Somma degli elementi per colonna
    colSum = sum(matrice);  
    
    % Seleziono solo le colonne pari (2,4,6,...) e calcolo la media
    elementiColonnePari = colSum(2:2:end);  
    media = mean(elementiColonnePari);
end
