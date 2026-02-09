function cond = condRoot(c, r, x)
% CONDROOT Calcola l'indice di condizionamento di una radice.
%  cond = CONDROOT(c, r, x) stima quanto la radice x (con molteplicità r)
%  è sensibile alle perturbazioni sui coefficienti del polinomio.
%
%  Input:
%    c - Vettore dei coefficienti (dal grado massimo al noto).
%    r - Molteplicità della radice x (r=1 per radici semplici).
%    x - Il valore della radice.
%
%  Output:
%    cond - Indice di condizionamento.

    n = length(c) - 1;   % Grado del polinomio

    % Calcola le derivate fino all'ordine r usando Horner Generalizzato
    p = HornerR(c, r, x);
    
    y = p(end);          % Valore della derivata r-esima: P^(r)(x)

    % Calcola i singoli termini del polinomio: a_k * x^potenza
    % (Serve per trovare il termine massimo al numeratore)
    for k = 1 : n+1
        fatt(k) = c(k) * x^(n - k + 1);
    end

    % Formula dell'indice di condizionamento per radici multiple:
    % K = (1/|x|) * [ (r! * max|a_k * x^k|) / |P^(r)(x)| ] ^ (1/r)
    cond = max(abs(fatt * factorial(r) / y).^(1/r)) / abs(x);

end
