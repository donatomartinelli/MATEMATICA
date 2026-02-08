function [x, i] = newton(x0, f, df, toll, itmax)
% NEWTON Trova la radice di f(x)=0 usando il metodo di Newton.
%   [x, i] = NEWTON(x0, f, df, toll, itmax) calcola l'approssimazione
%   della radice a partire da una stima iniiale x0.
%
%   Input:
%     x0    - (double) Stima iniziale
%     f     - (function_handle) La funzione f(x)
%     df    - (function_handle) La derivata prima f'(x)
%     toll  - (double, opzionale) Tolleranza per l'arresto (default 1e-6)
%     itmax - (integer, opzionale) Numero massimo di iterazioni (default 100)
%
%   Output:
%     x    - (vector) Vettore contenente tutte le iterazioni calcolate
%     iter - (integer) Numero di iterazioni effettuate

    %% 1. Validazione degli Input
    arguments
        x0    (1,1) double
        f     (1,1) function_handle
        df    (1,1) function_handle
        toll  (1,1) double {mustBePositive} = 1e-6
        itmax (1,1) double {mustBePositive, mustBeInteger} = 100
    end

    %% 2. Inizializzazione
    i = 1;               % Indice di posizione (parte da 1)
    x(i) = x0;           % Inserimento stima iniziale nel vettore
    
    fx = f(x(i));        % Valutazione funzione
    dfx = df(x(i));      % Valutazione derivata
    
    err = 1;             % Inizializzo l'errore per entrare nel loop

    %% 3. Ciclo Iterativo
    % Continua se: non ho superato itmax E l'errore è alto E il residuo è alto
    while (i < itmax) && (err > toll) && (abs(fx) > toll)
        
        % Controllo di sicurezza: Derivata nulla o quasi nulla
        if abs(dfx) < eps
            warning('Derivata quasi nulla in x = %f. Metodo arrestato.', x(i));
            break;
        end
        
        % Passo di Newton
        % Formula: x(k+1) = x(k) - f(x)/f'(x)
        x(i + 1) = x(i) - fx / dfx; % Calcolo e aggiungo il nuovo valore al vettore
        
        % Calcolo Errore Relativo
        % Nota: Aggiungo eps al denominatore per evitare crash se x_new è 0
        err = abs(x(i + 1) - x(i)) / (abs(x(i + 1)) + eps);
        
        % Aggiornamento indici e funzioni
        i = i + 1;
        fx = f(x(i));
        dfx = df(x(i));
    end
    
    %% 4. Controllo finale
    % L'indice 'i' punta all'ultimo elemento riempito. 
    % Le iterazioni vere e proprie sono (lunghezza vettore - 1).
    if i - 1 == itmax
        warning('Raggiunto il numero massimo di iterazioni (%d) senza convergenza.', itmax);
    end
end
