%% 1. Dati
n = 10;
A = zeros(n) + 4 * triu(ones(n),2) + 2 * (diag(ones(n-1,1),1) + diag(ones(n-2,1),-2)) + diag(ones(n-1,1),-1);
for i = 1:n
    A(i,i) = 1 / (i+1);
end
b = sum(A,2);
[Ag,bg] = gaussElim(A,b); % eliminazione di Gauss
x = backwardSub(Ag,bg);   % Soluzione calcolata con backwardSub
y = A \ b;              % Soluzione calcolata con function predefinita Matlab   
sol = ones(n,1);

%% 2. Calcolo Cifre Significative
C = cond(A, inf);
err_teorico = C * eps;
t = floor(1 - log10(2 * err_teorico)); 

% SICUREZZA: t deve essere tra 0 e 16 per non mandare in crash fprintf
t = min(max(t, 0), 16);

fprintf('Condizionamento: %e \nCifre significative (t): %d\n', C, t);
fprintf('Prime 2 componenti della soluzione calcolata con GE + backwardSub (formattata a %d cifre):\n', t);
for i = 1:2
    fprintf('Valore stampato: %.*e\n', t-1, x(i));
end

%% 3. Controllo Finale
fprintf('\nErrore massimo (Gauss vs Matlab):\n%e\n', norm(x-y,inf));
fprintf('\nErrore massimo (Gauss vs Esatta):\n%e\n', norm(x-sol,inf));
