%% 1. Setup Dati
n = 10;
A = triu(rand(n));

%% 2. Test Sistema Lineare (backwardSub)
b = sum(A, 2);                      % Soluzione attesa: vettore di 1
x_ref  = A \ b;                     % Benchmark MATLAB
x_calc = backwardSub(A, b);         % Soluzione Calcolata

err_System = errRel(x_ref, x_calc)  % Output errore sistema

%% 3. Test Inversione (invU)
V_ref  = inv(A);                    % Benchmark MATLAB
V_calc = invU(A);                   % Inversa Calcolata

err_Inverse = errRel(V_ref, V_calc) % Output errore inversione
