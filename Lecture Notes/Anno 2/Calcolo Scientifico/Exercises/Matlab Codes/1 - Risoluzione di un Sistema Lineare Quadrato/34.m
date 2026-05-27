function [L, U, rho] = factorLUr(A)
% FACTORLUR Esegue la fattorizzazione LU su una matrice A.
%  [L, U, rho] = factorLUr(A) fattorizza A in L*U (Gauss no pivoting)
%  e restituisce il fattore di crescita rho.
%    
%  Input:
%    A - Matrice dei coefficienti (n x n)
%
%  Output:
%    L   - Matrice triangolare inferiore unitaria (n x n)
%    U   - Matrice triangolare superiore (n x n)
%    rho - Fattore di crescita per la stabilità

    %% 1. Validazione degli Input
    arguments
        A (:,:) double {mustBeNumeric}
    end

    %% 2. Verifica Dimensioni
    % Estraggo le dimensioni
    [n, m] = size(A);
    
    % Verifica matrice quadrata
    if n ~= m
        error('factorLUr:NonSquareMatrix', 'La matrice deve essere quadrata (%dx%d).', n, m);
    end

    %% 3. Inizializzazione Fattore di Crescita
    % Pre-calcolo modulo per rho
    absA = abs(A);
    
    % Vettore per tracciare i massimi locali ad ogni passo
    rhos = zeros(1,n);
    
    % Memorizzo il massimo iniziale assoluto (denominatore di rho)
    rhos(1) = max(absA(:));

    %% 4. Eliminazione di Gauss
    for k = 1 : n-1
        % Controllo pivot nullo
        if A(k,k) == 0
             error('factorLUr:ZeroPivot', 'Pivot nullo alla riga %d.', k);
        end
        
        % Ciclo sulle righe sottostanti (i)
        for i = k+1 : n
            % Calcolo moltiplicatore (salvato con segno negativo)
            A(i,k) = -A(i,k) / A(k,k);
            
            % Aggiornamento riga i-esima (Eliminazione)
            for j = k+1:n
                A(i,j) = A(i,j) + A(i,k) * A(k,j);
            end
        end
        
        % --- Calcolo Massimo Locale per Rho ---
        % Estraggo sottomatrice attiva corrente (dimensioni n-k+1)
        tempSub = abs(A(k:n, k:n));
        
        % Azzeramento moltiplicatori: si trovano nella colonna 1 locale,
        % dalla riga 2 in poi (indici locali). Vanno esclusi dal max su U.
        tempSub(2:end, 1) = 0;
        
        % Memorizzo il massimo valore trovato nella parte attiva/U
        rhos(k+1) = max(tempSub(:));
    end
    
    %% 5. Costruzione Output
    L = eye(n) - tril(A, -1);
    U = triu(A);
    
    % Calcolo finale rho: max crescita / max iniziale
    rho = max(rhos) / rhos(1);
end


function [L, U, P, s, rho] = factorLUPPr(A)
% FACTORLUPPR Fattorizzazione LU con Pivoting Parziale (PA = LU).
%  [L, U, P, s, rho] = factorLUPPr(A)
%
%  Input:
%    A - Matrice dei coefficienti (n x n)
%
%  Output:
%    L   - Matrice triangolare inferiore unitaria
%    U   - Matrice triangolare superiore
%    P   - Matrice di permutazione
%    s   - Numero di scambi effettuati (per il determinante)
%    rho - Fattore di crescita (stabilità numerica)

    %% 1. Validazione Input
    arguments
        A (:,:) double {mustBeNumeric}
    end

    %% 2. Verifica Dimensioni
    % Estraggo le dimensioni
    [n, m] = size(A);

    % Verifico se la matrice è quadrata
    if n ~= m
        error('factorLUPP:NonSquareMatrix', 'La matrice deve essere quadrata (Size: %dx%d).', n, m);
    end

    %% 3. Inizializzazione
    absA = abs(A);
    P = eye(n);      % Matrice di permutazione iniziale
    s = 0;           % Contatore scambi
    
    % Inizializzazione vettore per rho
    rhos = zeros(1,n);
    if n > 0
        rhos(1) = max(absA(:)); % Massimo iniziale
    else
        rhos(1) = 0;
    end

    %% 4. Eliminazione di Gauss con Pivoting Parziale
    for k = 1 : n-1
        % Pivoting parziale
        % Trovo il massimo nella colonna k (dal pivot in giù)
        [~, r_rel] = max(abs(A(k:n, k)));

        % Converto in indice globale
        r_glob = r_rel + k - 1;
            
        % Se il pivot migliore non è quello attuale, scambio
        if r_glob ~= k
            % Scambio righe in A (compresi i moltiplicatori precedenti)
            A([k, r_glob], :) = A([r_glob, k], :);
            
            % Scambio righe in P
            P([k, r_glob], :) = P([r_glob, k], :);
            
            % Aggiorno variabile s
            s = s + 1;
        end
        
        % Controllo pivot nullo (sicurezza)
        if A(k,k) == 0
             error('factorLUPPr:SingularMatrix', 'Matrice singolare: pivot nullo alla riga %d.', k);
        end
        
        % Eliminazione
        for i = k+1 : n
            % Calcolo e assegnazione del moltiplicatore
            A(i,k) = -A(i,k) / A(k,k);
            
            % Aggiornamento riga i-esima
            for j = k+1:n
                A(i,j) = A(i,j) + A(i,k) * A(k,j);
            end
        end
        
        % Calcolo rho (Massimo Locale)
        % Estraggo sottomatrice attiva
        tempSub = abs(A(k:n, k:n));
        
        % Azzero i moltiplicatori appena calcolati
        % per misurare solo la crescita degli elementi di U.
        tempSub(2:end, 1) = 0;
        
        rhos(k+1) = max(tempSub(:));
    end
    
    %% 5. Costruzione Output
    % L: Identità - parte triangolare inferiore (segno compensato)
    L = eye(n) - tril(A, -1);
    
    % U: Parte triangolare superiore
    U = triu(A);
    
    % Calcolo Rho finale
    rho = max(rhos) / rhos(1);
end
