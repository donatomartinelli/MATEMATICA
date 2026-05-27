function [iter, x_vect, itmax] = bisecAlg(a, b, c, TOLL)
% BISECALG Trova la radice di un polinomio in [a,b].
%  [iter, x_vect, itmax] = bisecAlg(a, b, c, TOLL)
%
%  Input:
%    a, b - Estremi dell'intervallo di ricerca.
%    c    - Coefficienti del polinomio (per Horner).
%    TOLL - Tolleranza richiesta per l'arresto.
%
%  Output:
%    iter   - Numero di iterazioni effettuate.
%    x_vect - Vettore con la successione delle approssimazioni.
%    itmax  - Numero massimo di iterazioni teoriche previste.

    % Calcolo dei valori agli estremi usando Horner
    fa = Horner(c, a);
    fb = Horner(c, b);

    % Controllo esistenza dello zero (Teorema degli zeri)
    if fa * fb >= 0
        disp('bisecAlg:ZeroThm','La funzione non cambia segno agli estremi dell''intervallo.');
        iter = [];
        x_vect = [];
        itmax = [];
        return;
    end

    % Calcolo numero massimo di iterazioni teoriche
    itmax = 1 + floor(log((b - a) / TOLL) / log(2));
    
    % Pre-allocazione del vettore x per efficienza
    x_vect = zeros(itmax, 1);
    
    % Prima iterazione
    x_vect(1) = (a + b) / 2;
    fx = Horner(c, x_vect(1));
    iter = 1;

    % Ciclo di bisezione
    while iter < itmax && abs(fx) >= TOLL
        iter = iter + 1;
        
        % Selezione del sotto-intervallo
        if fa * fx < 0
            b = x_vect(iter-1);
        else
            a = x_vect(iter-1);
            fa = fx;
        end
        
        % Nuova stima
        x_vect(iter) = (a + b) / 2;
        fx = Horner(c, x_vect(iter));
    end
    
    % Rimuove gli zeri in eccesso se il ciclo è finito prima di itmax
    x_vect = x_vect(1:iter);

end
