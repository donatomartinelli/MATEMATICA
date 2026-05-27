function [Ag,bg] = gaussElimTri(A,b)
% GAUSSELIMTRI Applica il metodo dell'eliminazione di Gauss alla matrice dei coefficienti tridiagonale e al vettore dei termini noti.
%  [Ag,bg] = gaussElimTri(A,b)  restituisce A e b risultanti dall'eliminazione.
%    
%  Input:
%    A - Matrice dei coefficienti tridiagonale (n x n)
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
        error('gaussElimTri:NonSquareMatrix', 'La matrice non è quadrata (Size %dx%d).', n, m);
    end

    % Verifico se la matrice è tridiagonale
    if any(triu(A,2), 'all') || any(tril(A,-2), 'all')
        error('gaussElimTri:NonTridiagonalMatrix', "La matrice non è tridiagonale");
    end
    
    % Verifico se il prodotto Ab è compatibile
    if n ~= length(b)
        error('gaussElimTri:NonCompatible', 'Il prodotto non è compatibile (Size (%dx%d)*(%dx1)).', n, m, length(b));
    end
    
    %% 3. Eliminazione di Gauss ottimizzata
    for k = 1 : n-1
        % Controllo pivot nullo (sicurezza)
        if A(k,k) == 0
             error('gaussElimTri:ZeroPivot', 'Pivot nullo alla riga %d.', k);
        end
        
        % Eliminazione
        mol = -A(k+1,k) / A(k,k);
        A(k+1,k+1) = A(k+1,k+1) + mol * A(k,k+1);
        b(k+1) = b(k+1) + mol * b(k);
    end
    
    % Nota: Gli elementi della prima sottodiagonale non vengono azzerati 
    % fisicamente per risparmiare tempo, ma sono logicamente considerati zero.
    
    Ag = A;
    bg = b;
end
