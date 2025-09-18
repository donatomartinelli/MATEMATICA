% Scrivere una function in linguaggio Matlab che preveda in input due vettori v e w di 
% lunghezza n e n-1 rispettivamente ed effettui le seguenti operazioni: 
% - costruisca la matrice quadrata A che ha il vettore v come diagonale principale e il
%       vettore w, come prima colonna, a partire dalla seconda riga, e come ultima colonna, fino
%       alla penultima riga (Matrice a forma di N);
% - costruisca la matrice quadrata B che abbia gli elementi di A elevati al cubo;
% - costruisca la matrice C uguale alla somma di A e B;
% - sostituisca tutti gli elementi della matrice C uguali a 9 con 1;
% - restituisca il numero degli elementi della matrice C maggiori di 2 e la loro somma.


% Vettori di esempio
v = [1 -2 3 -4 -6 7];     % vettore principale (lunghezza n)
w = [5 -5 5 8 -9];        % vettore ausiliario (lunghezza n-1)


% Chiamata della funzione
[A, B, C, eleNum, eleSum] = abcMat(v, w);


% Stampa dei risultati
A
B
C
eleNum 
eleSum


% --- DEFINIZIONE DELLA FUNZIONE ---
function [A, B, C, eleNum, eleSum] = abcMat(vec1, vec2)
    N = length(vec1);     % Dimensione della matrice (uguale alla lunghezza di v)
    A = zeros(N);         % Inizializzo matrice NxN di zeri

    A(1 : N + 1 : end) = vec1;    % Inserisco v sulla diagonale principale
    A(2:N, 1) = vec2;             % Inserisco w nella prima colonna a partire dalla seconda riga
    A(1:N-1, N) = vec2;           % Inserisco w nell’ultima colonna fino alla penultima riga
    
    B = A.^3;      % Costruisco la matrice B elevando al cubo ogni elemento di A
    C = A + B;     % Costruisco la matrice C come somma di A e B

    % Sostituisco i valori pari a 9 con 1
    C(C == 9) = 1;

    % --- Conteggio e somma degli elementi maggiori di 2 ---
    mask = C > 2;              % Creo una maschera logica (1 se l’elemento è > 2, 0 altrimenti)
    eleNum = sum(mask(:));     % Numero di elementi maggiori di 2
    eleSum = sum(C(mask));     % Somma degli elementi maggiori di 2
end
