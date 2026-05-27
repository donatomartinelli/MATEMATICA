function isSym = isSymm(A, tol)
% ISSYMM Verifica se una matrice è simmetrica con una data tolleranza.
%  isSym = ISSYMM(A) restituisce true se A è simmetrica (entro 1e-10).
%  isSym = ISSYMM(A, tol) permette di specificare la tolleranza.
%
%  Input:
%    A   - Matrice numerica quadrata (double)
%    tol - (Opzionale) Soglia di tolleranza. Default: 1e-10
%
%  Output:
%    isSym - Logical true (1) se simmetrica, false (0) altrimenti

    %% 1. Validazione degli Input
    arguments
        A (:,:) double {mustBeNumeric}
        tol (1,1) double {mustBeNonnegative} = 1e-10
    end

    %% 2. Controllo Dimensioni
    [r, c] = size(A);  % Estraggo le dimensioni della matrice

    % Verifico che la matrice sia quadrata
    if r ~= c
        error('isSymm:DimError', 'La matrice deve essere quadrata (Input size: %dx%d).', r, c);
    end

    %% 3. Verifica Simmetria
    AT = A';  % Calcoliamo la trasposta una sola volta
    isSym = all( abs(A(:) - AT(:)) <= tol ); % Confrontiamo vettorialmente usando la tolleranza

end
