% Scrivere una function in linguaggio Matlab che preveda in input due vettori v e u, di
% lunghezza N e N-1 rispettivamente, e due numeri n1 e n2 ed effettui le seguenti operazioni:
% - costruisca la matrice quadrata che abbia:
%   • il vettore v sulla diagonale principale
%   • il valore n1 in tutte le entrate della parte triangolare inferiore, a partire dalla seconda sottodiagonale
%   • il vettore u/2 sulla prima sovradiagonale
% - conti quanti elementi della matrice sono inferiori a n2 e calcoli il loro minimo
% - restituisca il numero di tali elementi, il valore minimo e la sua posizione all’interno della matrice

v = [-10 2 -30 4 0 6];   % vettore principale (lunghezza N)
u = [-1 0 3 -2 7];       % vettore per la prima sovradiagonale (lunghezza N-1)

n1 = 3;   % valore da inserire sotto la seconda sottodiagonale
n2 = -2;  % soglia di confronto

% Chiamata della funzione principale
[numEl, valMin, posMin] = mainn(v, u, n1, n2);

% Stampa dei risultati
disp("Ci sono " + numEl + " elementi nella matrice minori di " + n2);
disp("Il minimo tra questi è " +  valMin);
disp("Posizione di " + valMin + " : " + posMin(1) + " , " + posMin(2));


function [numEl, valMin, posMin] = mainn(vec1, vec2, n1, n2)
    
    n = length(vec1);     % dimensione della matrice quadrata
    A = zeros(n);         % inizializza matrice NxN
    
    % Inserisce vec1 sulla diagonale principale
    A(1 : n+1 : end) = vec1;

    % Inserisce n1 dalla seconda sottodiagonale in giù
    for i = 1:n
        for j = 1:n
            if j - i < -1     % condizione: posizione sotto la prima sottodiagonale
                A(i,j) = n1;
            end
        end
    end

    A(n+1 : n+1 : end) = vec2 / 2;
    
    disp(A)   % mostra la matrice per controllo

    % Trova elementi minori di n2
    mask = A < n2;
    numEl = length(A(mask));   % conta quanti sono
    valMin = min(A(mask));     % calcola il minimo

    % Inizializza posizione del minimo
    rowMin = 0;
    colMin = 0;
    posMin = [rowMin colMin];
    
    % Ricerca esplicita della posizione del minimo
    for i = 1:n
        for j = 1:n
            if A(i,j) == valMin
                posMin(1) = i;
                posMin(2) = j; 
            end
        end
    end
end