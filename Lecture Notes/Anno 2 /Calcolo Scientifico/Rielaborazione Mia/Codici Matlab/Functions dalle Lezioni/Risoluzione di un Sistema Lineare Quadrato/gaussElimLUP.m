function [L, U, P] = gaussElimLUP(A)
%{
GAUSSELIMLUP Esegue la fattorizzazione LU con pivoting parziale.
  [L, U, P] = gaussElimLUP(A) calcola la fattorizzazione PA = LU
  tale che P*A = L*U.

    INPUT:
      A - Matrice dei coefficienti (n x n)

    OUTPUT:
      L - Matrice triangolare inferiore unitaria (n x n)
      U - Matrice triangolare superiore (n x n)
      P - Matrice di permutazione (n x n)
%}

    %% 1. Validazione degli Input
    arguments
        A (:,:) double {mustBeNumeric}
    end

    %% 2. Verifica Dimensioni
    [n, m] = size(A);

    if n ~= m
        error('gaussElimLUP:nonSquareMatrix', 'La matrice deve essere quadrata (Size: %dx%d).', n, m);
    end

    % Inizializzo P come matrice identità
    P = eye(n);

    %% 3. Eliminazione di Gauss con Pivoting
    for k = 1 : n-1
        
        % Pivoting parziale
        % Trovo il massimo nella colonna k (dal pivot in giù)
        [~, r_rel] = max(abs(A(k:n, k)));

        % Converto in indice globale
        r_glob = r_rel + k - 1;
            
        % Se il pivot migliore non è quello attuale, scambio
        if r_glob ~= k
            % Scambio le righe intere di A 
            A([k, r_glob], :) = A([r_glob, k], :);
            
            % Scambio le righe della matrice di permutazione P
            P([k, r_glob], :) = P([r_glob, k], :);
        end
        
        % Controllo pivot nullo (dopo lo scambio)
        if A(k,k) == 0
             error('gaussElimLUP:zeroPivot', 'Matrice singolare (pivot nullo alla riga %d).', k);
        end
        
        % Ciclo sulle righe sottostanti
        for i = k+1 : n

            % Calcolo e assegnazione del moltiplicatore
            A(i,k) = -A(i,k) / A(k,k);
            
            % Aggiornamento riga i-esima  (Eliminazione)
            A(i, k+1:n) = A(i, k+1:n) + A(i,k) * A(k, k+1:n);
        end
    end
    
    %% 4. Costruzione Output
    
    L = eye(n) - tril(A, -1);
    U = triu(A);
    % P è già stata costruita durante i cicli
end
