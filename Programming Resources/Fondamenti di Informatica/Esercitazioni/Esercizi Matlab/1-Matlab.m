% Scrivere una function in linguaggio Matlab che preveda in input un vettore ed effettui le seguenti operazioni:
% - costruisca la matrice quadrata "a freccia" che ha l'ultima riga, l'ultima colonna e la diagonale coincidenti con il vettore di input;
% - calcoli la somma degli elementi non nulli della matrice;
% - restituisca la somma calcolata e la matrice.

v = [1 1 2 1];

[sum, mat] = matFreccia(v);

mat
disp("Sum of Non-zero elements of the matrix: " + sum)

function [somma, matrice] = matFreccia(vettore)
    n = length(vettore);
    mat = zeros(n);

    mat(n,:) = vettore;
    mat(:,n) = vettore;
    mat(1:n+1:end) = vettore;

    sum = 0;

    for i = 1:1:n 
        for j = 1:1:n 
            if (mat(i,j) ~= 0)
                sum = sum + mat(i,j);
            end
        end
    end

    somma = sum;
    matrice = mat;
end
