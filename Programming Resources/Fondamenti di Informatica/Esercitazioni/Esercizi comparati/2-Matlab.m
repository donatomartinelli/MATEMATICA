v = [1 2 3 4 6 8 29];
w = [7 7 7 0 0 -1];

[mat, avg, elem] = matTrig(v, w);

disp("Matrice: ")
mat
disp("Media dei valori del vettore v: " + avg)
disp("Numero di elementi della matrice di valore maggiore dela media del vettore v: " + elem)

function [matrice, avg, elem] = matTrig(vec1, vec2)
    n = length(vec1);
    A = zeros(n);
    
    A(1 : n+1 : end) = vec1;
    A(n+1 : n+1 : end) = vec2;
    A(2 : n+1 : end) = -vec2;
    
    avgV = mean(vec1);
    elemMaggAvgV = length(A(A > avgV));
    
    matrice = A;
    avg = avgV;
    elem = elemMaggAvgV;
    
end 
