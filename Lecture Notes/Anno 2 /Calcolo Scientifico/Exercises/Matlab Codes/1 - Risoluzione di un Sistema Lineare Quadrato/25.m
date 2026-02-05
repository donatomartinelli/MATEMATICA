%% 1. Dati
n = 50;
A = 2 * ones(n);
for i = 1:n
    A(i,i) = 2 + 1 / i;
end
A(1,n) = 6;
A(n,1) = 6;
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

% Il condizionamento (ordine 10^4) causa una perdita teorica di 4 cifre 
% significative (nella pratica ne sono state perse 3). Dato che entrambi i 
% metodi forniscono lo stesso risultato, l'errore non dipende dall'algoritmo 
% (che è stabile in entrambi i casi), ma è intrinseco alla matrice stessa.
