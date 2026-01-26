function invU = invTriu(U, tol)
%INVTRIU Calcola l'inversa di una matrice triangolare superiore.
%   invU = INVTRIU(U) calcola l'inversa della matrice U usando
%   la sostituzione all'indietro (backward substitution).
%
%   invU = INVTRIU(U, tol) specifica una tolleranza per il controllo
%   di singolarità (default: 1e-10).
%
%   Input:
%       U   - Matrice triangolare superiore (n x n)
%       tol - Tolleranza per singolarità (scalare opzionale)
%
%   Output:
%       invU - Inversa della matrice U
%
%   Vedi anche: BACKWARDSUB, INV, TRIU.

    %% 1. Validazione degli Input
    arguments
        U   (:,:) double {mustBeNumeric}
        tol (1,1) double {mustBeNonnegative} = 1e-10
    end

    %% 2. Verifica Dimensioni e Singolarità
    [n, m] = size(U);

    % Verifica che la matrice sia quadrata
    if n ~= m
        error('invTriu:NonSquareMatrix', ...
              'La matrice di input deve essere quadrata (%dx%d).', n, m);
    end

    % Verifica singolarità (elemento diagonale nullo o sotto tolleranza)
    if any(abs(diag(U)) < tol)
        error('invTriu:SingularMatrix', ...
              'Matrice singolare: pivot sulla diagonale minore della tolleranza.');
    end

    %% 3. Calcolo Inversa
    % L'inversa di una triangolare superiore è anch'essa triangolare superiore.
    % Risolviamo il sistema U * x = e_i per ogni colonna i riducendo la dimensione.
    
    I    = eye(n);
    invU = zeros(n);

    for i = 1:n
        % Estrai la sottomatrice quadrata [1:i, 1:i]
        Ui = U(1:i, 1:i);
        
        % Risolvi il sistema ridotto per la i-esima colonna della matrice identità
        vi = backwardSub(Ui, I(1:i, i));
        
        % Assegna il risultato alla colonna i-esima dell'inversa
        invU(1:i, i) = vi;
    end

end
