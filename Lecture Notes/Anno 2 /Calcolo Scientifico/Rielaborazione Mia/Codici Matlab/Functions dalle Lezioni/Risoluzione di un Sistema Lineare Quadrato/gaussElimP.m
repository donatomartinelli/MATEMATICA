function [Ag,bg] = gaussElimP(A,b)
%{
GAUSSELIMP Applica il metodo dell'eliminazione di Gauss alla matrice dei
coefficienti e al vettore dei termini noti implementando il pivoting
parziale.
  [Ag,bg] = gaussElimP(A,b)  restituisce A e b risultanti dall'eliminazione con pivoting parziale.
    
    INPUT:
      A - Matrice dei coefficienti (n x n)
      b - Vettore dei termini noti (n x 1)
    
    OUTPUT:
      Ag - Matrice dei coefficienti post-GE (n x n)
      bg - Vettore dei termini noti post-GE (n x 1)
%}
    
    %% 1. Validazione degli Input
    arguments
        A (:,:) double {mustBeNumeric}
        b (:,1) double {mustBeNumeric}
    end
    
    %% 2. Verifica Dimensioni
    [n, m] = size(A);
    
    % Verifico se la matrice è quadrata
    if n ~= m
        error('gaussElimP:nonSquareMatrix', 'La matrice non è quadrata (Size %dx%d).', n, m);
    end
    
    % Verifico se il prodotto Ab è compatibile
    if n ~= length(b)
        error('gaussElimP:nonCompatible', 'Il prodotto non è compatibile (Size (%dx%d)*(%dx1)).', n, m, length(b));
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
             error('gaussElimP:zeroPivot', 'Pivot nullo alla riga %d.', k);
        end
        
        % --- ELIMINAZIONE ---
        for i = k+1 : n
            mol = -A(i,k) / A(k,k);
            
            % Aggiorno la riga i (Vettorizzazione mista)
            A(i, k+1:n) = A(i, k+1:n) + mol * A(k, k+1:n);
            
            % Aggiorno il termine noto
            b(i) = b(i) + mol * b(k);

            % Pulizia formale (Facoltativo ma consigliato per l'output)
            % A(i,k) = 0;
        end
    end
    
    Ag = A;
    bg = b;
end
