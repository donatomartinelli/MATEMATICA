%% 1. Setup Dati
n = 20;
A = tril(rand(n));

%% 2. Test Inversione (invL)
V_ref  = inv(A);                    % Benchmark MATLAB
V_calc = invL(A);                   % Inversa Calcolata

err_Inverse = errRel(V_ref, V_calc) % Output errore inversione