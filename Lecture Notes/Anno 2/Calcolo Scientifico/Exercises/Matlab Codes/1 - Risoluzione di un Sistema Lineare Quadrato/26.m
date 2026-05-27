%% 1. Dati
n = 80;
A = zeros(n);
vec1 = zeros(n-2,1);
for i = 1:n-2
    vec1(i) = 1 / (i + 1);
end
A = A + diag(vec1,2);
A(n-1,1) = 1 / 3;
A(n,2) = 1 / 3;
for i = 1:n
    A(i,i) = 4 * i + 1;
end
b = ones(n,3);
b(:,2) = 2 * ones(n,1);
for i = 1:n 
    b(i,3) = i;
end

Y = zeros(n,3);
X = zeros(n,3);

%% 2. Calcolo Cifre Significative
C = cond(A, inf);
err_teorico = C * eps;
t = floor(1 - log10(2 * err_teorico)); 

% SICUREZZA: t deve essere tra 0 e 16 per non mandare in crash fprintf
t = min(max(t, 0), 16);

fprintf('Condizionamento: %e \nCifre significative (t): %d\n', C, t);

[L, U] = factorLU(A);        % Fattorizzazione LU
% Soluzione calcolata con forwardSub
for i = 1:3
    Y(:,i) = forwardSub(L,b(:,i));
end
% Soluzione calcolata con backwardSub
for i = 1:3
    X(:,i) = backwardSub(U,Y(:,i));
end

fprintf('\nPrime componenti della soluzione (Riga 1):\n');
formatSpec = sprintf('%%.%de\\n', t-1);
fprintf(formatSpec, X(1,:));

%% 3. Controllo Finale
fprintf('\nResiduo relativo:\n%e\n', norm(A * X - b, inf) / norm(b,inf));
