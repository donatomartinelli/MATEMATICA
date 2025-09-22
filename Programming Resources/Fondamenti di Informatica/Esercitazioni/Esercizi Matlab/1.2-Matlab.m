% Dato il vettore di elementi –5, –4, …., 8, 9 determinare l’elemento massimo, minimo, di
% modulo massimo, di modulo minimo, la somma degli elementi, la somma dei valori assoluti degli elementi.

x = [-5:1:9];

% Calcoli su elementi originali
maxX = max(x)
minX = min(x)
somma_elementi = sum(x)

% Calcoli sui moduli (valori assoluti)
y = abs(x);
modulo_massimo = max(y)
modulo_minimo = min(y)
somma_moduli = sum(y)