function [p, dp] = Horner(a, t)
% HORNER Valuta un polinomio e la sua derivata prima usando l'algoritmo di Horner.
%  [p, dp] = HORNER(a, t) calcola il valore del polinomio P(x) e della sua
%  derivata P'(x) nel punto (o nei punti) t.
%
%  Input:
%    a - Vettore dei coefficienti ordinati dal grado massimo al minimo
%      P(x) = a(1)*x^n + a(2)*x^(n-1) + ... + a(n)*x + a(n+1)
%    t - Punto/i in cui valutare il polinomio (scalare o vettore).
%
%  Output:
%    p  - Valore del polinomio calcolato in t.
%    dp - Valore della derivata prima calcolata in t.

    % Numero totale di coefficienti (grado del polinomio n = m - 1)
    m = length(a);
    
    % Inizializzazione con il coefficiente di grado massimo
    p = a(1);
    dp = p;
    
    % Ciclo di Horner: aggiorna p e dp iterativamente
    % Nota: Il ciclo si ferma al penultimo coefficiente
    for i = 2 : m-1
        p = p .* t + a(i);      % Aggiorna valore polinomio
        dp = dp .* t + p;       % Aggiorna derivata usando il nuovo p
    end
    
    % Ultimo passo per il polinomio (aggiunta del termine noto)
    % La derivata è già completa all'uscita del ciclo
    p = p .* t + a(m);
    
end
