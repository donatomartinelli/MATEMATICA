function x = diagSub(D, b, tol)
% DIAGSUB Risolve il sistema lineare diagonale Dx = b. 
%  X = DIAGSUB(D, B, TOL) restituisce il vettore soluzione X.
%
%  Input:
%    D - Matrice quadrata diagonale (n x n)
%    b - Vettore dei termini noti (n x 1)
%    tol (opzionale) - Tolleranza per verifica della singolarità (1 x 1)
%
%  Output:
%    x - Vettore soluzione (n x 1)

    %% 1. Validazione degli Input
    arguments
        D (:,:) double {mustBeNumeric}
        b (:,1) double {mustBeNumeric}
        tol (1,1) double {mustBeNumeric} = 1e-10
    end

    %% 2. Controllo Dimensioni
    % Estraggo le dimensioni
    [n,m] = size(D);
    
    % Verifico che D sia quadrata
    if n ~= m
        error('diagSub:NonSquareMatrix', 'La matrice D deve essere quadrata (Input %dx%d).', n, m);
    end

    % Verifico che b sia compatibile con D
    if m ~= length(b)
        error('diagSub:DimensionMismatch', 'Le dimensioni di D e b non corrispondono (Input (%dx%d)x(%dx1)).',n,m,length(b));
    end
    
    %% 3. Controllo Singolarità
    if any(abs(diag(D)) < tol)
        error('diagSub:SingularMatrix', 'La matrice è singolare.');
    end

    %% 4. Sostituzione in Avanti
    % Pre-allocazione
    x = zeros(n, 1);

    % Ciclo principale
    for i = 1 : n 
        x(i) = b(i) / D(i,i);
    end

end
