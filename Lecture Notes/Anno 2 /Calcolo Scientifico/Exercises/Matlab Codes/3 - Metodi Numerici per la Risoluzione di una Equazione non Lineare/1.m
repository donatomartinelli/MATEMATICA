function [x, i, itmax] = bisec(a, b, f, toll)
% BISEC Trova la radice di f(x)=0 in [a,b] con il metodo di Bisezione.
%
%   Input:
%     a, b  - Estremi dell'intervallo
%     f     - Function handle della funzione
%     toll  - Tolleranza richiesta (default 1e-6)
%
%   Output:
%     x     - Vettore con la storia delle approssimazioni
%     i     - Numero di iterazioni effettuate
%     itmax - Numero massimo di iterazioni teoriche previste

    %% 1. Validazione degli Input
    arguments
        a     (1,1) double
        b     (1,1) double
        f     (1,1) function_handle
        toll  (1,1) double {mustBePositive} = 1e-6
    end

    %% 2. Controllo Esistenza Zeri (Teorema degli Zeri)
    fa = f(a);
    fb = f(b);

    % Uso sign() per evitare overflow se f(a)*f(b) diventa troppo grande
    if sign(fa) * sign(fb) > 0
        error('La funzione non cambia segno agli estremi dell''intervallo [a,b].');
    end

    %% 3. Inizializzazione
    % Calcolo teorico del numero di passi necessari
    itmax = 1 + floor(log((b-a)/toll)/log(2));

    i = 1;              % Indice corrente
    x(i) = (a + b) / 2; % Primo punto medio
    fx = f(x(i));       % Valutazione nel punto medio

    %% 4. Ciclo Iterativo
    % Continua finché non finisco i passi E l'errore è alto
    while (i < itmax) && (abs(fx) >= toll)
        
        % Selezione del sotto-intervallo
        if sign(fx) * sign(fa) < 0
            b = x(i);   % La radice è a sinistra (tra a e x)
        else
            a = x(i);   % La radice è a destra (tra x e b)
            fa = fx;    % Fondamentale: aggiorno fa per il prossimo confronto
        end
        
        % Nuovo passo
        i = i + 1;
        x(i) = (a + b) / 2; % Nuovo punto medio
        fx = f(x(i));       % Nuova valutazione
    end

end
