%% Setup Dati
n = 100;
A = rand(n);
b = sum(A, 2);    % Soluzione attesa: vettore di 1

%% Test Sistema Lineare (gaussElim)   
x_ref  = A \ b;                     % Benchmark MATLAB
[Ag,bg] = gaussElim(A, b);          % Applico eliminazione di Gauss 
x_calc = backwardSub(Ag,bg);        % Soluzione Calcolata

err_System = errRel(x_ref,x_calc)   % Output errore sistema