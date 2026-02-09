function [x_vect, iter] = newtonAlg(x0, c, m, TOLL, itmax)
% NEWTONALG Trova la radice di un polinomio con il metodo di Newton.
%  [x_vect, iter] = newtonAlg(x0, c, m, TOLL, itmax)
%
%  Input:
%    x0    : Stima iniziale della radice.
%    c     : Vettore dei coefficienti del polinomio (per Horner).
%    m     : Molteplicità della radice attesa (m=1 per radici semplici).
%    TOLL  : Tolleranza richiesta per l'arresto (su incremento e residuo).
%    itmax : Numero massimo di iterazioni consentite.
%
%  Output:
%    x_vect : Vettore contenente la successione delle approssimazioni.
%    iter   : Numero di iterazioni effettuate.

    % Pre-allocazione del vettore delle soluzioni per efficienza
    x_vect = zeros(itmax, 1);
    
    % Inizializzazione
    x_vect(1) = x0;
    iter = 1;
    err = 1; % Errore relativo iniziale arbitrario > TOLL
    
    % Calcolo valore e derivata nel punto iniziale usando Horner
    [fx, dfx] = Horner(c, x_vect(1));
    
    % Ciclo di Newton
    % Criteri di arresto: max iterazioni, errore relativo, residuo
    while (iter < itmax) && (err > TOLL) && (abs(fx) > TOLL)
        
        % Controllo per evitare divisione per zero (derivata nulla)
        if dfx == 0
            disp('Arresto: La derivata si è annullata.');
            break;
        end
        
        % Passo di Newton modificato per la molteplicità m
        % x_{k+1} = x_k - m * (f(x_k) / f'(x_k))
        x_vect(iter + 1) = x_vect(iter) - m * (fx / dfx);
        
        % Calcolo dell'errore relativo stimato
        if x_vect(iter + 1) ~= 0
            err = abs(x_vect(iter + 1) - x_vect(iter)) / abs(x_vect(iter + 1));
        else
            err = abs(x_vect(iter + 1) - x_vect(iter)); % Errore assoluto se x è 0
        end
        
        % Aggiornamento per la prossima iterazione
        iter = iter + 1;
        [fx, dfx] = Horner(c, x_vect(iter));
        
    end
    
    % Ridimensiona il vettore al numero reale di iterazioni fatte
    x_vect = x_vect(1:iter);

end
