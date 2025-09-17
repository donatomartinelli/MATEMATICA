% Scrivere una function in linguaggio Matlab che preveda in input 4 numeri reali x, y, z e t ed effettui le seguenti operazioni:
% - costruisca la matrice quadrata A che abbia tutti gli elementi al di sotto della diagonale principale coincidenti con x e tutti gli elementi sulla diagonale principale coincidenti con y;
% - costruisca la matrice quadrata B che abbia tutti gli elementi al di sopra della diagonale principale coincidenti con z e tutti gli elementi sulla diagonale principale coincidenti con t;
% - calcoli la somma C delle matrici A e B;
% - restituisca la matrice C.

n = input("Inserisci ordine matrice: ");
x = input("Inserisci numero reale: ");
y = input("Inserisci numero reale: ");
z = input("Inserisci numero reale: ");
t = input("Inserisci numero reale: ");

A = matTrigInf(n,x,y)
B = matTrigSup(n,z,t)

C = A + B

function [mat] = matTrigSup(n, num1, num2)
    A = zeros(n);
    
    A(1 : n+1 : end) = num2;     % diagonale principale
    A(n+1 : n+1 : end) = num1;   % sopradiagonale
        
    mat = A;
end

function [mat] = matTrigInf(n, num1, num2)
    A = zeros(n);
    
    A(1 : n+1 : end) = num2;     % diagonale principale
    A(2 : n+1 : end) = num1;     % sottodiagonale
        
    mat = A;
end
