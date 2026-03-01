% Scrivere una function in linguaggio Matlab che preveda in input due vettori v e w di
% lunghezza N e N-2 rispettivamente ed effettui le seguenti operazioni:
% - costruisca la matrice quadrata "quadridiagonale" che ha come diagonale principale il
%       vettore v, come seconda sopradiagonale il vettore 2w e come seconda sottodiagonale il vettore -3w;
% - conti quanti elementi della matrice sono superiori a 10 e calcoli la loro somma;
% - restituisca il numero di tali elementi e la loro somma.


% ================== ESEMPIO DI UTILIZZO ==================
v = [1 2 3 4 5 11 7 8];   % diagonale principale
w = [8 -8 -8 -8 -8 9];    % per le diagonali secondarie

[numEl, somEl, mat] = matQuad(v, w);

mat    % stampa la matrice
numEl  % stampa il numero di elementi > 10
somEl  % stampa la somma di tali elementi


% ================== DEFINIZIONE DELLA FUNZIONE ==================
function [numEl, somEl, mat] = matQuad(vec1, vec2)
    N = length(vec1);         % dimensione della matrice quadrata
    A = zeros(N);             % inizializzo la matrice NxN di zeri

    % Inserisco la diagonale principale
    A(1 : N + 1 : end) = vec1;

    % Inserisco la seconda sopradiagonale (2w)
    % Nota: 2*N+1 è lo "scarto" corretto per muoversi sulla 2a sopradiagonale
    A(2 * N + 1 : N + 1 : end) = 2 * vec2;

    % Inserisco la seconda sottodiagonale (-3w)
    % Lo scarto per questa diagonale è 3 : N+1 : (N-2)*N
    A(3 : N + 1 : (N - 2) * N) = -(3 * vec2);

    % Inizializzo contatori
    numEl = 0;   % numero di elementi > 10
    somEl = 0;   % somma degli elementi > 10

    % Ciclo su tutta la matrice per trovare gli elementi > 10
    for m = 1 : N
        for n = 1 : N
            if A(m,n) > 10
                numEl = numEl + 1;      % incremento il contatore
                somEl = somEl + A(m,n); % aggiungo alla somma
            end
        end 
    end 

    % Restituisco risultati
    mat = A;
end
