format long e;

%% 1. Costruzione del problema
n = 80;

% Costruzione matrice A
A = triu(2 * ones(n), 1) + tril(3 * ones(n), -1); % Triangolari sup/inf
for i = 1:n
    A(i,i) = 3 + 1/i;                             % Diagonale
end
A(n,1) = 10; 
A(1,n) = 8;                                       % Elementi "corner"

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
fprintf('Errore relativo soluzione:   %e\n', err_sol);

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
