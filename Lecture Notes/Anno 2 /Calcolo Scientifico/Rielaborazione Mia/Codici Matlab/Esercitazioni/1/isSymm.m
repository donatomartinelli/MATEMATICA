function bool = isSymm(mat)
%{ 
    ISSYMM Verifica se una matrice è simmetrica.
    bool = ISSYMM(mat) restituisce un valore booleano: 1 se simmetrica, 0 altrimenti. 
    
    INPUT:
    mat - La matrice di cui vogliamo verificare la simmetricità
    
    OUTPUT:
    bool - Valore booleano
%}

%% 1. Validazione degli Input

arguments
    mat (:,:) double {mustBeNumeric} 
end


%% 2. Controllo Dimensioni

n = size(mat,1);
if size(mat, 2) ~= n
    error('IsSymm:NonSquareMatrix', 'La matrice deve essere quadrata.');
end

%% 3. Verifica Simmetria
matT = mat'; 
bool = all( abs(mat(:) - matT(:)) < eps );

end

function isSym = isSymm(A, tol)
% ISSYMM Verifica se una matrice è simmetrica con una data tolleranza.
%   isSym = ISSYMM(A) restituisce true se A è simmetrica (entro 1e-10).
%   isSym = ISSYMM(A, tol) permette di specificare la tolleranza.
%
%   INPUT:
%       A   - Matrice numerica quadrata (double)
%       tol - (Opzionale) Soglia di tolleranza. Default: 1e-10
%
%   OUTPUT:
%       isSym - Logical true (1) se simmetrica, false (0) altrimenti

    %% 1. Validazione degli Input
    arguments
        A (:,:) double {mustBeNumeric}
        tol (1,1) double {mustBeNonnegative} = 1e-10
    end

    %% 2. Controllo Dimensioni
    [r, c] = size(A);
    if r ~= c
        error('isSymm:DimError', 'La matrice deve essere quadrata (Input size: %dx%d).', r, c);
    end

    %% 3. Verifica Simmetria
    % Calcoliamo la trasposta una sola volta
    AT = A'; 
    
    % Confrontiamo vettorialmente usando la tolleranza
    % Nota: Usiamo (:) per linearizzare ed evitare cicli for
    isSym = all( abs(A(:) - AT(:)) <= tol );

end