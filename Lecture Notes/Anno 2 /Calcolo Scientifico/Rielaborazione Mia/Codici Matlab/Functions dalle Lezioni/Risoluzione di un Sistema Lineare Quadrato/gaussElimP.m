function [Ag,bg] = gaussElimP(A,b,p)
%{
GAUSSELIMP Applica l'eliminazione di Gauss (con pivoting opzionale).
%}

    %% 1. Validazione Input
    arguments
        A (:,:) double {mustBeNumeric}
        b (:,1) double {mustBeNumeric}
        p (1,1) logical = false 
    end

    %% 2. Verifica Dimensioni
    [n, m] = size(A);
    
    if n ~= m
        error('gaussElimP:nonSquare', 'Matrice non quadrata (%dx%d).', n, m);
    end
    
    if n ~= length(b)
        error('gaussElimP:dimMismatch', 'Dimensioni incompatibili: A(%dx%d), b(%dx1).', n, m, length(b));
    end

    %% 3. Algoritmo di Gauss
    % Unico ciclo principale: evita la duplicazione del codice
    for k = 1 : n-1
        
        % --- FASE PIVOTING (Opzionale) ---
        if p
            % Ricerca del massimo nella colonna k (dal pivot in giù)
            [~, r_rel] = max(abs(A(k:n, k))); 
            r_glob = r_rel + k - 1;           % Conversione indice locale -> globale
            
            % Scambio righe se necessario
            if r_glob ~= k
                A([k, r_glob], :) = A([r_glob, k], :);
                b([k, r_glob])    = b([r_glob, k]);
            end
        end
        
        % --- CONTROLLO SINGOLARITÀ ---
        % Importante: Se dopo il pivoting il pivot è ancora 0, la matrice è singolare.
        if A(k,k) == 0
            error('gaussElimP:singularMatrix', 'Pivot nullo alla riga %d. Matrice singolare.', k);
        end

        % --- FASE ELIMINAZIONE ---
        for i = k+1 : n
            % Calcolo moltiplicatore
            mol = -A(i,k) / A(k,k);
            
            % Aggiornamento riga i-esima (Vettorizzazione mista)
            % Nota: operiamo solo da k+1 in poi per risparmiare calcoli
            A(i, k+1:n) = A(i, k+1:n) + mol * A(k, k+1:n);
            
            % (Opzionale ma pulito) Forziamo a zero l'elemento sotto il pivot
            % A(i,k) = 0; 

            % Aggiornamento termine noto
            b(i) = b(i) + mol * b(k);
        end
    end

    Ag = A;
    bg = b;
end
