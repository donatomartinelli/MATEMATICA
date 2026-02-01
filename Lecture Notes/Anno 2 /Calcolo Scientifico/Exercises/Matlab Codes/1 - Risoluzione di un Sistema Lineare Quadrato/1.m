function isSym = isSymm(mat, tol)
%ISSYMM Verifica se una matrice è simmetrica con una data tolleranza.
%  isSym = ISSYMM(mat) restituisce true se mat è simmetrica (entro 1e-10).
%  isSym = ISSYMM(mat, tol) permette di specificare la tolleranza.
%
%  INPUT:
%    mat - Matrice numerica quadrata (double)
%    tol - (Opzionale) Soglia di tolleranza. Default: 1e-10
%
%  OUTPUT:
%    isSym - Logical true (1) se simmetrica, false (0) altrimenti

    %% 1. Validazione degli Input
    arguments
        mat (:,:) double {mustBeNumeric}
        tol (1,1) double {mustBeNonnegative} = 1e-10
    end

    %% 2. Controllo Dimensioni
    % Estraggo le dimensioni della matrice
    [r, c] = size(mat);

    % Verifico che la matrice sia quadrata
    if r ~= c
        error('isSymm:DimError', 'La matrice deve essere quadrata (Input size: %dx%d).', r, c);
    end

    %% 3. Verifica Simmetria
    % Calcoliamo la trasposta una sola volta
    matT = mat'; 
    
    % Confrontiamo vettorialmente usando la tolleranza
    isSym = all( abs(mat(:) - matT(:)) <= tol );

end
