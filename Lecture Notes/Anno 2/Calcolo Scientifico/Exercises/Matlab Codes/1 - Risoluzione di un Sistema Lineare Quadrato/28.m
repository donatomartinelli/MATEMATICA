function [Ag,bg] = gaussElimHS(A,b)
% GAUSSELIMHS Applica il metodo dell'eliminazione di Gauss alla matrice dei coefficienti Hessenberg
% superiore e al vettore dei termini noti.
%  [Ag,bg] = gaussElimHS(A,b)  restituisce A e b risultanti dall'eliminazione.
%    
%  Input:
%    A - Matrice dei coefficienti Hessenberg superiore (n x n)
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
    
    %% 2. Verifica Dimensioni e Proprietà
    [n, m] = size(A);
    
    % Verifico se la matrice è quadrata
    if n ~= m
        error('gaussElimHS:NonSquareMatrix', 'La matrice non è quadrata (Size %dx%d).', n, m);
    end

    % Verifico se la matrice è Hessenberg superiore
    if any(tril(A,-2), 'all')
        error('gaussElimHS:NonHSMatrix', "La matrice non è Hessenberg superiore");
    end
    
    % Verifico se il prodotto Ab è compatibile
    if n ~= length(b)
        error('gaussElimHS:NonCompatible', 'Il prodotto non è compatibile (Size (%dx%d)*(%dx1)).', n, m, length(b));
    end
    
    %% 3. Eliminazione di Gauss ottimizzata
    for k = 1 : n-1
        % Controllo pivot nullo (sicurezza)
        if A(k,k) == 0
             error('gaussElimHS:ZeroPivot', 'Pivot nullo alla riga %d.', k);
        end
        
        % Eliminazione
        mol = -A(k+1,k) / A(k,k);
        for j = k+1:n
            A(k+1,j) = A(k+1,j) + mol * A(k,j);
        end
        
        b(k+1) = b(k+1) + mol * b(k);
    end
    
    % Nota: Gli elementi della prima sottodiagonale non vengono azzerati 
    % fisicamente per risparmiare tempo, ma sono logicamente considerati zero.
    
    Ag = A;
    bg = b;
end
