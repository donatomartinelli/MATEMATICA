function root = bisec(f, a, b, toll)
% BISEC Trova la radice approssimata di f con il metodo di Bisezione.
%  root = BISEC(f, a, b, toll) restituisce la radice stimata data una certa
%  tolleranza.
%  
%  Input:
%    f    - Funzione
%    a    - Estremo inferiore dell'intervallo
%    b    - Estremo superiore dell'intervallo
%    toll - Tolleranza per il calcolo della soluzione
%   
%  Output: 
%    root - Radice stimata data la tolleranza 

    %% 1. Validazione degli Input
    arguments
        f (1,1) function_handle
        a (1,1) double {mustBeNumeric, mustBeReal}
        b (1,1) double {mustBeNumeric, mustBeReal}
        toll (1,1) double {mustBePositive} = 1e-5
    end

    %% 2. Controllo Condizioni
    % Controllo e Swap estremi
    if a > b
        warning("Estremi invertiti. Procedo allo scambio (a < b).");
        [a, b] = deal(b, a);
    end

    % Calcolo iniziale di f(a)
    fa = f(a);
    fb = f(b);

    % Verifica caso limite (radice sugli estremi)
    if fa == 0
        root = a;
        return;
    elseif fb == 0
        root = b;
        return;
    end

    % Controllo segno (usando sign() per evitare overflow numerici)
    if sign(fa) * sign(fb) > 0 
        error("La funzione deve avere segni opposti agli estremi del dominio.")
    end

    %% 3. Bisezione
    % Calcolo iterazioni necessarie
    k = floor(log((b-a)/toll)/log(2)) + 1;
    fprintf('Iterazioni previste: %d\n', k);

    % Inizializzazione di sicurezza
    root = a; 

    % Ciclo Principale
    for i = 1:k
        m = (a + b) / 2;
        fm = f(m);
        
        % Check radice esatta (raro ma possibile)
        if fm == 0
            root = m;
            fprintf("Radice esatta trovata a iterazione %d: %e\n", i, m);
            return;
        end
    
        % Aggiornamento intervallo
        if sign(fa) * sign(fm) < 0
            b = m;
        else
            a = m;
            fa = fm;
        end
    
        % Aggiornamento stima corrente
        root = m;
    end
end
