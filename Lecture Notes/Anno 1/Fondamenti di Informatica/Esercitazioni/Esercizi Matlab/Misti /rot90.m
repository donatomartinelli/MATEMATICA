% Scrivere un programma che data una matrice A NxN 
% crea una nuova matrice B ruotata di 90 gradi in senso antiorario rispetto ad A.

N = 4;   % Dimensione della matrice quadrata
A = [ 1 2 3 4 ;    % Matrice di partenza
      2 3 4 5 ;
      6 7 8 9 ;
      0 0 0 0 ];

B = zeros(N);   % Inizializza la matrice risultato con zeri

% Ciclo sulle righe di A
for i = 1 : N
    C = A(i,:);             % Estrae la riga i-esima di A
    B(:,i) = C(N : -1 : 1); % Inserisce la riga invertita come colonna in B
end

B   % Stampa la matrice ruotata
