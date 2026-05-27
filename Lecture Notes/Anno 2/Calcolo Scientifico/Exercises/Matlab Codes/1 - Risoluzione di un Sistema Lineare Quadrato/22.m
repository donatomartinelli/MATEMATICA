function [Ag,bg] = gaussElimPP(A,b)
% GAUSSELIMPP Applica il metodo dell'eliminazione di Gauss alla matrice dei
%  coefficienti e al vettore dei termini noti implementando il pivoting parziale.
%  [Ag,bg] = gaussElimPP(A,b)  restituisce A e b risultanti dall'eliminazione con pivoting parziale.
%    
%  Input:
%    A - Matrice dei coefficienti (n x n)
%    b - Vettore dei termini noti (n x 1)
%    
%  Output:
%    Ag - Matrice dei coefficienti post-GE (n x n)
%    bg - Vettore dei termini noti post-GE (n x 1)
    
    %% 1. Validazione degli Input
    arguments
        A (:,:) double {mustBeNumeric}
        b (:,1) double {mustBeNumeric}
    end
    
    %% 2. Verifica Dimensioni
    [n, m] = size(A);
    
    % Verifico se la matrice è quadrata
    if n ~= m
        error('gaussElimPP:NonSquareMatrix', 'La matrice non è quadrata (Size %dx%d).', n, m);
    end
    
    % Verifico se il prodotto Ab è compatibile
    if n ~= length(b)
        error('gaussElimPP:NonCompatible', 'Il prodotto non è compatibile (Size (%dx%d)*(%dx1)).', n, m, length(b));
    end
    
    
    %% 3. Eliminazione di Gauss
    for k = 1 : n-1        
        % Pivoting parziale
        % Trovo il massimo nella colonna k (dal pivot in giù)
        [~, r_rel] = max(abs(A(k:n, k)));
            
        % Converto in indice globale
        r_glob = r_rel + k - 1;
            
        % Se il pivot migliore non è quello attuale, scambio
        if r_glob ~= k
            A([k, r_glob], :) = A([r_glob, k], :);
            b([k, r_glob])    = b([r_glob, k]);
        end
        
        % Controllo pivot nullo (sicurezza)
        if A(k,k) == 0
             error('gaussElimPP:ZeroPivot', 'Pivot nullo alla riga %d.', k);
        end
        
        % Eliminazione di Gauss
        for i = k+1 : n
            mol = -A(i,k) / A(k,k);
            
            for j = k+1:n
                A(i,j) = A(i,j) + mol * A(k,j);
            end
            
            % Aggiorno il termine noto
            b(i) = b(i) + mol * b(k);
        end
    end
    
    % Nota: Gli elementi A(i,k) sotto la diagonale non vengono azzerati fisicamente
    % per risparmiare tempo, ma sono logicamente considerati zero.

    Ag = A;
    bg = b;
end
