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
    
    A(1 : n+1 : end) = num2; % diagonale principale
    A(n+1 : n+1 : end) = num1; % sopradiagonale
        
    mat = A;
end

function [mat] = matTrigInf(n, num1, num2)
    A = zeros(n);
    
    A(1 : n+1 : end) = num2; % diagonale principale
    A(2 : n+1 : end) = num1; % sottodiagonale
        
    mat = A;
end
