clc;clear;clc; format long e;

n = 100;
A = zeros(n) + 5 * eye(n) + diag(2 * ones(n-2,1),2);
A(2:n,1) = 4;
A(1,n) = 1;
A(1,1) = 9;
A = A * A';

b = sum(A,2);
sol = ones(n,1);

C = cond(A,inf);
err_teor = C * eps;
t = floor(1-log10(2 * err_teor));
fprintf("Condizionamento: %e\nCifre significative corrette stimate: %d\n", C, t);
%{
Poichè la matrice è simmetrica e definita positiva, è ottimale procedre con
la fattorizzazione di Cholesky, seguita da sostituzione in avanti e
all'indietro. Il costo computazionale totale è 
n^3/6 + n^2/2 + n^2/2 = n^3/6 + n^2. 
Alternativamente si sarebbe potuta usare la fattorizzazione LU con pivoting
parziale. Sebbene teoricamente valido e capace di raggiungere la stessa
precisione, risulta meno efficiente di Cholesky perchè ignora la simmetria
della matrice, comportando un costo computazionale doppio.
%}

L = cholDec(A);
y = forwardSub(L,b);
x = backwardSub(L',y);

err_rel = norm(sol - x,inf) / norm(sol,inf);
s = floor(1-log10(2 * err_rel));
fprintf("\nErrore relativo in norma infinito: %e\n", err_rel);
fprintf("Cifre significative corrette: %d\n", s);

det_or = det(A);
det_calc = prod(diag(L'))^2;

err_rel_det = errRel(det_or,det_calc);
fprintf("\nErrore relativo tra i due determinanti: %e\n", err_rel_det);

inv_or = inv(A);
inv_calc = zeros(n);
I = eye(n);
for i = 1:n
    y = forwardSub(L,I(:,i));
    inv_calc(:,i) = backwardSub(L',y);
end

err_rel_inv = errRel(inv_or,inv_calc);
fprintf("Errore relativo tra le due inverse: %e\n", err_rel_inv);

[L,U,rho] = factorLUr(A);
fprintf("Fattore di crescita rispetto a LU: %e\n", rho);
