function V = invU(U, tol)
% INVU calcola l'inversa di una matrice triangolare superiore ottimizzando
% la sostituzione all'indietro con una certa tolleranza
%  V = INVU(U, tol) restituisce l'inversa della matrice U.
%
%  Input:
%    U - Matrice triangolare superiore numerica (n x n)
%    tol (opzionale) - Tolleranza per la verifica della singolarità (1 x 1)
%    
%  Output:
%    V - Matrice triangolare superiore numerica inversa di U (n x n)

    %% 1. Validazione Input
    arguments
        U (:,:) double {mustBeNumeric}
        tol (1,1) double {mustBeNumeric} = 1e-10
    end

    %% 2. Controllo Dimensioni
    % Estraggo le dimensioni
    [n,m] = size(U);

    % Verifico che U sia quadrata
    if n ~= m
        error('invU:NonSquareMatrix', 'La matrice U deve essere quadrata (Input %dx%d).', n, m);
    end

    % Verifico che U sia non singolare
    if any(abs(diag(U)) < tol)
        error('invU:SingularMatrix', 'La matrice U è singolare.');
    end

    %% 3. Calcolo Inversa
    % Pre-allocazione
    V = zeros(n);

    % Costruzione dell'inversa V
    for j = 1:n
        % Calcolo dell'elemento diagonale (Pivot)
        V(j,j) = 1 / U(j,j);
        for i = j-1:-1:1
            % Inizializzazione dell'accumulatore per la sommatoria
            V(i,j) = 0;
            for k = i+1:j
                V(i,j) = V(i,j) - U(i,k) * V(k,j);
            end
            % Divisione finale per il coefficiente della diagonale
            V(i,j) = V(i,j) / U(i,i);
        end
    end

end
