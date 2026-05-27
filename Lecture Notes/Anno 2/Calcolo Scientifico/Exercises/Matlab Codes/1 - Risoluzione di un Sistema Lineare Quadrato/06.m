function isDom = diagDomCol(A)
% DIAGDOMCOL Verifica se una matrice è a diagonale dominante per colonne.
%   isDom = DIAGDOMCOL(A) restituisce true se la matrice A è a diagonale
%   dominante per colonne.
%
%   Input:
%       A - Matrice quadrata numerica.
%
%   Output:
%       isDom - Logical true (1) se dominante per colonne, false (0) altrimenti. 

    %% 1. Validazione Input
    arguments
        A (:,:) {mustBeNumeric}
    end

    %% 2. Controllo Dimensioni
    % Estraggo le dimensioni
    [m, n] = size(A);
    if m ~= n
        error('diagDomCol:NonSquareMatrix', 'La matrice deve essere quadrata (Input %dx%d).', m, n);
    end

    %% 3. Verifico Proprietà
    % Calcolo i valori assoluti
    absA = abs(A);

    % Estraggo la diagonale
    d_diag = diag(absA);

    % Calcolo la somma di ogni colonna
    sum_cols = sum(absA).';

    % Calcolo la somma degli elementi extra-diagonali
    sum_off_diag = sum_cols - d_diag;

    % Verifica della condizione 
    isDom = true;
    for j = 1:n
        if d_diag(j) <= sum_off_diag(j)
            isDom = false;
            return; % Interrompe appena trova una colonna che viola la condizione
        end
    end

end
