function [L, U, P, s] = factorLUPP(A)
% FACTORLUPP Esegue la fattorizzazione LU con pivoting parziale.
%  [L, U, P, s] = factorLUPP(A) calcola la fattorizzazione PA = LU e
%  restituisce il numero di scambi effettuati.
%
%    Input:
%      A - Matrice dei coefficienti (n x n)
%
%    Output:
%      L - Matrice triangolare inferiore unitaria (n x n)
%      U - Matrice triangolare superiore (n x n)
%      P - Matrice di permutazione (n x n)
%      s - Numero di scambi effettuati (1 x 1)

    %% 1. Validazione degli Input
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

    %% 3. Eliminazione di Gauss con Pivoting Parziale
    % Inizializzo P come matrice identità
    P = eye(n);
    % Inizializzo s
    s = 0;

    for k = 1 : n-1
        % Pivoting parziale
        % Trovo il massimo nella colonna k (dal pivot in giù)
        [~, r_rel] = max(abs(A(k:n, k)));

        % Converto in indice globale
        r_glob = r_rel + k - 1;
            
        % Se il pivot migliore non è quello attuale, scambio
        if r_glob ~= k
            A([k, r_glob], :) = A([r_glob, k], :);
            
            % Scambio le righe della matrice di permutazione P
            P([k, r_glob], :) = P([r_glob, k], :);

            % Aggiorno variabile s
            s = s + 1;
        end
        
        % Controllo pivot nullo (sicurezza)
        if A(k,k) == 0
             error('factorLUPP:ZeroPivot', 'Matrice singolare (pivot nullo alla riga %d).', k);
        end
        
        % Ciclo sulle righe sottostanti
        for i = k+1 : n
            % Calcolo e assegnazione del moltiplicatore
            A(i,k) = -A(i,k) / A(k,k);
            
            % Aggiornamento riga i-esima
            for j = k+1:n
                A(i,j) = A(i,j) + A(i,k) * A(k,j);
            end
        end
    end
    
    %% 4. Costruzione Output
    L = eye(n) - tril(A, -1);
    U = triu(A);
    % P è già stata costruita durante i cicli
end 
