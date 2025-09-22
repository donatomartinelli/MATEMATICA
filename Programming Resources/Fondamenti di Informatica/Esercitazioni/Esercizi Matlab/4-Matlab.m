% Scrivere una function in linguaggio Matlab che preveda in input due vettori x e y di uguale lunghezza ed effettui le seguenti operazioni:
% - costruisca la matrice quadrata che ha la prima riga, l'ultima riga, e la diagonale 
%       coincidenti con x e le prima colonna e l'ultima colonna coincidenti con il vettore y;
% - calcoli il prodotto degli elementi non nulli della matrice;
% - restituisca il prodotto calcolato e la matrice.

v = [-1 4 0 3];   % primo vettore esempio
w = [5 -4 -1 0];  % secondo vettore esempio

[prod, mat] = matQuadVecs(v, w); % costruisce matrice e calcola prodotto

prod  % stampa prodotto
mat   % stampa matrice


function [prod, mat] = matQuadVecs(vec1, vec2)

    n = length(vec1);         % Lunghezza dei vettori (uguale per x e y)
    mat = zeros(n);           % Inizializza matrice n×n con zeri

    % Imposta prima e ultima riga con vec1
    mat(1,:) = vec1;          
    mat(n,:) = vec1;          

    % Imposta diagonale principale con vec1
    mat(1:n+1:end) = vec1;    

    % Imposta prima e ultima colonna con vec2 (sovrascrive eventuali conflitti)
    mat(:,1) = vec2;
    mat(:,n) = vec2;

    % Calcola il prodotto degli elementi non nulli
    prod = 1;
    for i = 1:n
        for j = 1:n
            if (mat(i,j) ~= 0)
                prod = prod * mat(i,j);
            end
        end
    end
end
