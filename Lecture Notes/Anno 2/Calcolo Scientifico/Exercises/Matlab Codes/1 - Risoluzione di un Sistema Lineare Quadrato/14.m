%% 1. Setup Dati
n = 10;
A = diag(diag(rand(n)));

%% 2. Test Sistema Diagonale (diagSub)
b = sum(A, 2);                      % Soluzione attesa: vettore di 1
x_ref  = A \ b;                     % Benchmark MATLAB
x_calc = diagSub(A, b);             % Soluzione Calcolata

err_System = errRel(x_ref, x_calc)  % Output errore sistema
