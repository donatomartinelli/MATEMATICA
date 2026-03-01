% Definire una matrice rettangolare di ordine 5×4 di zeri. Modificare la prima riga con il
% vettore [1 2 3 4] , la terza riga con il vettore [5 6 7 8] e l’ultima con il vettore [9 10 11 12].
% Sostituire quindi agli elementi nulli il valore 2.

% Creare una matrice 5x4 di soli zeri
A = zeros(5,4);

% Modifica della prima riga con il vettore [1 2 3 4]
A(1,:) = 1:4;

% Modifica della terza riga con il vettore [5 6 7 8]
A(3,:) = 5:8;

% Modifica dell’ultima riga (quinta) con il vettore [9 10 11 12]
A(5,:) = 9:12;

% Sostituire gli elementi nulli con il valore 2
A(A == 0) = 2;

% Visualizzare la matrice finale
disp(A);