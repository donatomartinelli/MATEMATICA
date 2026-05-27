function [L, U] = factorLU(A)
% FACTORLU Esegue la fattorizzazione LU su una matrice A.
%  [L, U] = factorLU(A) fattorizza la matrice A in L * U usando 
%  l'eliminazione di Gauss senza pivoting.
%    
%  Input:
%    A - Matrice dei coefficienti (n x n)
%
%  Output:
%    L - Matrice triangolare inferiore unitaria (n x n)
%    U - Matrice triangolare superiore (n x n)

    %% 1. Validazione degli Input
    arguments
        A (:,:) double {mustBeNumeric}
    end

    %% 2. Verifica Dimensioni
    % Estraggo le dimensioni
    [n, m] = size(A);

    % Verifico se la matrice è quadrata
    if n ~= m
        error('factorLU:NonSquareMatrix', 'La matrice dei coefficienti deve essere quadrata (Size: %dx%d).', n, m);
    end

    %% 3. Eliminazione di Gauss
    for k = 1 : n-1
        % Controllo pivot nullo
        if A(k,k) == 0
             error('factorLU:ZeroPivot', 'Pivot nullo incontrato alla riga %d.', k);
        end
        
        % Ciclo sulle righe sottostanti
        for i = k+1 : n
            % Calcolo e assegnazione del moltiplicatore
            A(i,k) = -A(i,k) / A(k,k);
            
            % Aggiornamento della riga i-esima (Eliminazione)
            for j = k+1:n
                A(i,j) = A(i,j) + A(i,k) * A(k,j);
            end
        end
    end
    
    % Costruzione di L e U
    L = eye(n) - tril(A, -1);
    U = triu(A);
end
