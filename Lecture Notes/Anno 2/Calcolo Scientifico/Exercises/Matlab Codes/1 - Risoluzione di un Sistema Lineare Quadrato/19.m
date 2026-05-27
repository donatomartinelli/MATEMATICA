%% 1. Dati
n = 15;
A = zeros(n) - tril(ones(n),-1) + 100 * eye(n);
b = ones(n,1);
x = forwardSub(A,b);    % Soluzione calcolata con forwardSub
y = A \ b;              % Soluzione calcolata con function predefinita Matlab   

%% 2. Calcolo Cifre Significative
C = cond(A, inf);
err_teorico = C * eps;
t = floor(1 - log10(2 * err_teorico)); 

% SICUREZZA: t deve essere tra 0 e 16 per non mandare in crash fprintf
t = min(max(t, 0), 16);

fprintf('Condizionamento: %e \nCifre significative (t): %d\n', C, t);
fprintf('Prime 2 componenti della soluzione calcolata con forwardSub (formattata a %d cifre):\n', t);
for i = 1:2
    fprintf('Valore stampato: %.*e\n', t-1, x(i));
end

%% 3. Controllo Finale
fprintf('\nErrore massimo (forwardSub vs Matlab): %e\n', norm(x-y,inf));
