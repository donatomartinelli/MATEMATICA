clc;clear;clc; format short e;

%% 1. Costruzione del problema
n = 40;

% Costruzione matrice A
A = zeros(n) + triu(3 * ones(n), 3) + tril(2 * ones(n), -2);
vec1 = ones(n-1,1);
A = A + diag(vec1,1);
vec1 = ones(n-2,1);
for j = 1:n-2
    vec(j) = 1 / (j + 1);
end
A = A + diag(vec,2);
% Triangolari sup/inf
for i = 1:n
    A(i,i) = 10;     % Diagonale
end

A(n,1) = 1; 
A(n-1,1) = 1 / 2; 
A(n,2) = 1 / 2;

% Termine noto e soluzione di riferimento
b   = sum(A, 2);
sol = ones(n, 1);

fprintf('ANALISI SISTEMA LINEARE (n=%d)\n', n);
fprintf('--------------------------------------------------\n');

%% 2. Analisi del Condizionamento
C       = cond(A, inf);
err_teo = C * eps;
t       = floor(1 - log10(2 * err_teo));

fprintf('Condizionamento K(A)_inf:    %e\n', C);
fprintf('Cifre significative attese:  %d\n', t);
fprintf('--------------------------------------------------\n');

%% 3. Risoluzione sistema (LUPP)
[L, U, P, s] = factorLUPP(A);

% Risoluzione Ax = b -> LUx = Pb
y = forwardSub(L, P * b);
x = backwardSub(U, y);

% Calcolo errore relativo soluzione
err_sol = errRel(sol, x);
t_sol   = floor(1 - log10(2 * err_sol));
fprintf('Errore relativo soluzione:   %e\n', err_sol);
fprintf('Cifre significative corrette:  %d\n', t_sol);

%% 4. Calcolo Determinante
detA_calc = (-1)^s * prod(diag(U));
detA_orig = det(A); 

% Calcolo errore relativo determinante
err_det = errRel(detA_orig, detA_calc);
fprintf('Errore relativo determinante:%e\n', err_det);

%% 5. Calcolo Inversa
V_calc = zeros(n);
I      = eye(n);

% Risoluzione n sistemi lineari Ax_i = e_i
for i = 1:n
    y = forwardSub(L, P * I(:,i));
    V_calc(:,i) = backwardSub(U, y);
end

% Calcolo errore relativo inversa
err_inv = errRel(inv(A), V_calc);
fprintf('Errore relativo inversa:     %e\n', err_inv);
fprintf('--------------------------------------------------\n');
