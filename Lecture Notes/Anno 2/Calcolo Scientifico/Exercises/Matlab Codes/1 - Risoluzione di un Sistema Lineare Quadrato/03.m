function isDom = diagDomRow(A)
% DIAGDOMROW Verifica se una matrice è a diagonale dominante per righe.
%   isDom = DIAGDOMROW(A) restituisce true se la matrice A è a diagonale
%   dominante per righe.
%
%   Input:
%       A - Matrice quadrata numerica.
%
%   Output:
%       isDom - Logical true (1) se dominante per righe, false (0) altrimenti. 

    %% 1. Validazione Input
    arguments
        A (:,:) {mustBeNumeric}
    end

    %% 2. Controllo Dimensioni
    % Estraggo le dimensioni
    [m, n] = size(A);
    if m ~= n
        error('diagDomRow:NonSquareMatrix', 'La matrice deve essere quadrata (Input %dx%d).', m, n);
    end

    %% 3. Verifico Proprietà
    % Calcolo i valori assoluti
    absA = abs(A);

    % Estraggo la diagonale
    d_diag = diag(absA);

    % Calcolo la somma di ogni riga
    sum_rows = sum(absA,2);

    % Calcolo la somma degli elementi extra-diagonali
    sum_off_diag = sum_rows - d_diag;

    % Verifica della condizione 
    isDom = true;
    for i = 1:m
        if d_diag(i) <= sum_off_diag(i)
            isDom = false;
            return; % Interrompe appena trova una riga che viola la condizione
        end
    end

end
