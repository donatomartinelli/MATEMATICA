function [Ag,bg] = gaussElim(A,b)
% GAUSSELIM Applica il metodo dell'eliminazione di Gauss alla matrice dei coefficienti e al vettore dei termini noti.
%  [Ag,bg] = gaussElim(A,b)  restituisce A e b risultanti dall'eliminazione.
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
        error('gaussElim:NonSquareMatrix', 'La matrice non è quadrata (Size %dx%d).', n, m);
    end
    
    % Verifico se il prodotto Ab è compatibile
    if n ~= length(b)
        error('gaussElim:NonCompatible', 'Il prodotto non è compatibile (Size (%dx%d)*(%dx1)).', n, m, length(b));
    end
    
    
    %% 3. Eliminazione di Gauss
    for k = 1 : n-1
        % Controllo pivot nullo (sicurezza)
        if A(k,k) == 0
             error('gaussElim:ZeroPivot', 'Pivot nullo alla riga %d.', k);
        end
        
        % Eliminazione
        for i = k+1 : n
            mol = -A(i,k) / A(k,k);
            for j = k+1:n
                A(i,j) = A(i,j) + mol * A(k,j);
            end
            b(i) = b(i) + mol * b(k);
        end
    end
    
    % Nota: Gli elementi A(i,k) sotto la diagonale non vengono azzerati fisicamente
    % per risparmiare tempo, ma sono logicamente considerati zero.
    
    Ag = A;
    bg = b;
end