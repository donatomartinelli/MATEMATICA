function isSym = isSymm(A, tol)
%ISSYMM Verifica se una Arice è simmetrica con una data tolleranza.
%  isSym = ISSYMM(A) restituisce true se A è simmetrica (entro 1e-10).
%  isSym = ISSYMM(A, tol) permette di specificare la tolleranza.
%
%  INPUT:
%    A   - Matrice numerica quadrata (double)
%    tol - (Opzionale) Soglia di tolleranza. Default: 1e-10
%
%  OUTPUT:
%    isSym - Logical true (1) se simmetrica, false (0) altrimenti

    %% 1. Validazione degli Input
    arguments
        A (:,:) double {mustBeNumeric}
        tol (1,1) double {mustBeNonnegative} = 1e-10
    end

    %% 2. Controllo Dimensioni
    % Estraggo le dimensioni della matrice
    [r, c] = size(A);

    % Verifico che la matrice sia quadrata
    if r ~= c
        error('isSymm:DimError', 'La matrice deve essere quadrata (Input size: %dx%d).', r, c);
    end

    %% 3. Verifica Simmetria
    % Calcoliamo la trasposta una sola volta
    AT = A'; 
    
    % Confrontiamo vettorialmente usando la tolleranza
    isSym = all( abs(A(:) - AT(:)) <= tol );

end
