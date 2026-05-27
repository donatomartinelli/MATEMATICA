%% 1. Definizione Dati
f = @(x) x + 3 * log(x);
df = @(x) 1 + 3 / x;
a = 0.5;
b = 1;
TOLL = eps;

%% 2. Bisezione
[x_b, iter_b] = bisec(a, b, f, TOLL);
fprintf("Radice stimata con metodo di bisezione: %e\n", x_b(end));
fprintf("Iterazioni: %d\n\n", iter_b);

%% 3. Newton
[x_n, iter_n] = newton(a, f, df, TOLL); % Metto come punto iniziale a
fprintf("Radice stimata con metodo di Newton (punto iniziale 0.5): %e\n", x_n(iter_n));
fprintf("Iterazioni: %d\n\n", iter_n);

%% 4. Bisezione-Newton
[x_bis, i_bis, x_newt, i_newt] = bisnew(a, b, f, df, TOLL);
fprintf("Radice stimata con metodo di Bisezione-Newton: %e\n", x_newt(i_newt));
fprintf("Iterazioni totali: %d (Bis: %d + New: %d)\n\n", i_bis + i_newt, i_bis, i_newt);
