% Scrivere una function in linguaggio Matlab che preveda in input due vettori x e y di uguale
%   lunghezza pari N ed effettui le seguenti operazioni:
% - costruisca la matrice quadrata che ha le colonne dispari coincidenti con x, e quelle pari
%     coincidenti con gli elementi di y considerati in ordine dall’ultimo al primo; 
% - calcoli la media degli elementi della sottomatrice principale di ordine N/2;
% - restituisca la media calcolata e la matrice.


% Script di test per la funzione main
x = [1 2 3 0];
y = [-4 -5 -6 -2];

[media, mat] = main(x,y);  % Richiamo della funzione

% Visualizzo i risultati
disp('Media calcolata:');
disp(media);

disp('Matrice costruita:');
disp(mat);


function [media, matrice] = main(vec1,vec2)
    
    n = length(vec1);       % Lunghezza dei vettori (deve essere pari)
    A = ones(n);            % Preallocazione matrice n x n
    vec2 = flip(vec2);      % Inverti l'ordine di vec2
    
    % Riempimento colonne: dispari con vec1, pari con vec2
    for k = 1:n
        if mod(k,2) == 0
            A(:,k) = vec2;  % Colonne pari ← vec2 invertito
        else 
            A(:,k) = vec1;  % Colonne dispari ← vec1
        end
    end
    
    % Estrazione della sottomatrice principale di ordine n/2
    m = n/2;                % NB: n deve essere pari!
    B = A(1:m, 1:m);
    
    % Calcolo media degli elementi della sottomatrice
    media = mean(B(:));
    
    % Output matrice costruita
    matrice = A;
end