% Definire la matrice A = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16]. Per tale matrice:
% - determinare le dimensioni;
% - estrarre la sottomatrice costituita dalle prime due righe;
% - estrarre la sottomatrice costituita dalle prima e dalla terza riga;
% - estrarre la sottomatrice costituita dalle prime tre colonne;
% - estrarre la sottomatrice principale di ordine 2×3;
% - elevare al quadrato i suoi elementi;
% - estrarre la matrice diagonale;
% - estrarre le matrici triangolare superiore e triangolare inferiore;
% - ridefinire gli elementi della terza riga con un vettore di tutti 1;
% - sostituire tutti gli elementi maggiori di 10 con zero.

% Definizione della matrice A 4x4
A = [1:4; 5:8; 9:12; 13:16];

% Dimensioni della matrice
righe = size(A,1);   % numero di righe
colonne = size(A,2); % numero di colonne

disp("Matrice: ");
disp(A);
disp("Dimensioni della matrice: " + righe + " x " + colonne);

% Sottomatrice con le prime due righe
disp("Sottomatrice costituita dalle prime due righe:");
disp(A(1:2,:));

% Sottomatrice con la prima e la terza riga
disp("Sottomatrice costituita dalla prima e dalla terza riga:");
disp(A([1,3],:));

% Sottomatrice con le prime tre colonne
disp("Sottomatrice costituita dalle prime tre colonne:");
disp(A(:,1:3));

% Sottomatrice principale di ordine 2x3 (prime 2 righe e prime 3 colonne)
disp("Sottomatrice principale di ordine 2x3:");
disp(A(1:2,1:3));

% Elevare al quadrato tutti gli elementi della matrice
disp("Matrice con elementi elevati al quadrato:");
disp(A.^2);

% Matrice diagonale estratta da A
disp("Matrice diagonale:");
B = zeros(4);         % matrice 4x4 di zeri
B(1:5:end) = diag(A); % inserisce gli elementi diagonali di A
disp(B);

% Matrici triangolare superiore e inferiore
disp("Matrice triangolare superiore:");
disp(triu(A));
disp("Matrice triangolare inferiore:");
disp(tril(A));

% Ridefinire la terza riga con un vettore di tutti 1
disp("Terza riga sostituita con un vettore di 1:");
D = A;
D(3,:) = ones(1,4);
disp(D);

% Sostituire tutti gli elementi maggiori di 10 con zero
disp("Matrice con elementi > 10 sostituiti da 0:");
E = A;
E(E > 10) = 0;
disp(E);