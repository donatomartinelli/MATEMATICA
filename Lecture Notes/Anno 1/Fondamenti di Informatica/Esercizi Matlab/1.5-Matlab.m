% Scrivere una function Matlab che costruisca una matrice tridiagonale simmetrica di ordine
% n avente sulla diagonale il vettore [1,2,..,n] e sottodiagonale con tutti gli elementi uguali a –1. 
% Eseguire la function per n = 20. Sia A la matrice costruita. Visualizzare dalla CW la 
% struttura della matrice usando >> spy(A)

n = 20;                % ordine della matrice

[mat] = trimat(n);     % costruzione della matrice tridiagonale tramite funzione

spy(mat);              % visualizzazione della struttura sparsa della matrice


% -------- FUNCTION --------
function [matrice] = trimat(n)
    v = 1:n;           % vettore [1,2,...,n] da porre sulla diagonale principale
    A = zeros(n);      % inizializzazione matrice n x n di zeri

    % Diagonale principale
    A(1:n+1:end) = v;
    
    % Sopradiagonale (elementi subito sopra la diagonale principale)
    A(n+1:n+1:end) = -1;

    % Sottodiagonale (elementi subito sotto la diagonale principale)
    A(2:n+1:end) = -1;
    
    matrice = A;       % restituisce la matrice costruita
end