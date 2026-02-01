function isPositive = isDefPos(A)
% ISDEFPOS Determina se una matrice è definita positiva.
%   isPositive = ISDEFPOS(A) restituisce true se la matrice A è definita
%   positiva utilizzando il criterio di Sylvester (tutti i minori principali
%   di testa devono avere determinante strettamente positivo).
%
%   INPUT:
%       A - Matrice quadrata numerica (reale e simmetrica).
%
%   OUTPUT:
%       isPositive - Logical true (1) se simmetrica, false (0) altrimenti.

    %% 1 - Validazione degli Input
    arguments
        A (:,:) {mustBeNumeric, mustBeReal}
    end

    %% 2 - Controllo Dimensioni e Simmetria
    % Estraggo le dimensioni della matrice
    [r,c] = size(A);

    % Verifico che la matrice sia quadrata
    if r ~= c
        error('isDefPos:NonSquareMatrix', 'La matrice di input deve essere quadrata (%dx%d).', rows, cols);
    end

    % Verifica della simmetria (condizione necessaria per def. pos. reale)
    if ~isSymm(A)
        error('isDefPos:NonSymmetricMatrix', 'La matrice deve essere simmetrica per applicare il criterio.');
    end

    %% 3 - Verifica Definita Positività
    % Inizializzazione
    isPositive = true;

    % Criterio di Sylvester con uscita anticipata
    for k = 1:r
        minorDet = det(A(1:k, 1:k));
        
        if minorDet <= 0
            isPositive = false;
            return; % Interrompe il calcolo se un minore non soddisfa la condizione
        end
    end

end
