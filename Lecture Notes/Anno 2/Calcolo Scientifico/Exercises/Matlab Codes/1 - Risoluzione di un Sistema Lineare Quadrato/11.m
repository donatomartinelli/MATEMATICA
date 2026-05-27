format long e

%% 1. Setup
A = tril(rand(10));      % Matrice triangolare inferiore casuale
b = sum(A, 2);           % Se b è la somma delle righe, la soluzione esatta è un vettore di '1'

%% 2. Risoluzione
x_ref  = A \ b;             % Benchmark (Solver interno di MATLAB)
x_calc = forwardSub(A, b);  % Test

%% 3. Verifica
% Calcoliamo l'errore relativo tra la tua soluzione e quella di MATLAB.
e = errRel(x_ref, x_calc) 
