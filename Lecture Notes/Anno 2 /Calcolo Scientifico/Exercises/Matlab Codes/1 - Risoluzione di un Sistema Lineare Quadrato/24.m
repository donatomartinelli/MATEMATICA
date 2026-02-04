clc; clear; clc;

%% 1. Dati
n = 18;
A = ones(n);
for i = 1:n
    for j = 1:n
        A(i,j) = cos((j-1) * pi * ((2 * i-1) / (2 * n)));
    end
end
b = sum(A,2);
sol = ones(n,1);

%% 2. Calcolo Cifre Significative
C = cond(A, inf);
err_teorico = C * eps;
t = floor(1 - log10(2 * err_teorico)); 

% SICUREZZA: t deve essere tra 0 e 16 per non mandare in crash fprintf
t = min(max(t, 0), 16);

fprintf('Condizionamento: %e \nCifre significative (t): %d\n', C, t);

[Age,bge] = gaussElim(A,b);    % Eliminazione di Gauss
xge = backwardSub(Age,bge);    % Soluzione calcolata con backwardSub
errxge = errRel(sol,xge);
cscxge = cifSigCorr(sol,xge);

[Agepp,bgepp] = gaussElimPP(A,b);    % Eliminazione di Gauss con Pivoting Parziale
xgepp = backwardSub(Agepp,bgepp);    % Soluzione calcolata con backwardSub
errxgepp = errRel(sol,xgepp);
cscxgepp = cifSigCorr(sol,xgepp);

%% 3. Controllo Finale
fprintf('\nErrore relativo (Gauss vs Esatta):\n%e\n', errxge);
fprintf('Cifre significative corrette:\n%d\n', cscxge);
fprintf('\nErrore relativo (GaussPP vs Esatta):\n%e\n', errxgepp);
fprintf('Cifre significative corrette:\n%d\n', cscxgepp);
