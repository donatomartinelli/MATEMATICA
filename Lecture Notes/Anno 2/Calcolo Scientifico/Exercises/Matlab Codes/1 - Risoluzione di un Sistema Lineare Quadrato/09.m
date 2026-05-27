function x = backwardSub(U, b, tol)
% BACKWARDSUB Risolve il sistema lineare triangolare superiore Ux = b usando la sostituzione all'indietro. 
%  x = BACKWARDSUB(U, b, tol) restituisce il vettore soluzione x.
%
%  Input:
%    U - Matrice quadrata triangolare superiore (n x n)
%    b - Vettore dei termini noti (n x 1)
%    tol (opzionale) - Tolleranza per verifica della singolarità (1 x 1)
%    
%  Output:
%    x - Vettore soluzione (n x 1)

    %% 1. Validazione degli Input
    arguments
        U (:,:) double {mustBeNumeric}
        b (:,1) double {mustBeNumeric}
        tol (1,1) double {mustBeNumeric} = 1e-10
    end

    %% 2. Controllo Dimensioni
    % Ricaviamo le dimensioni
    [n, m] = size(U);
    
    % Verifichiamo che U sia quadrata
    if n ~= m
        error('backwardSub:NonSquareMatrix', 'La matrice U deve essere quadrata (Input %dx%d).', n, m);
    end

    % Verifichiamo che b sia compatibile con U
    if m ~= length(b)
        error('backwardSub:DimensionMismatch', 'Le dimensioni di U e b non corrispondono (Input (%dx%d)x(%dx1)).', n, m, length(b));
    end
    
    %% 3. Controllo Singolarità
    % Se c'è uno zero sulla diagonale, non possiamo dividere.
    % Usiamo una piccola tolleranza per i numeri floating point.
    if any(abs(diag(U)) < tol)
        error('backwardSub:SingularMatrix', 'La matrice è singolare.');
    end

    %% 4. Sostituzione all'indietro
    % Pre-allocazione
    x = zeros(n, 1);

    % Ultimo elemento
    x(n) = b(n) / U(n,n);
    
    % Ciclo principale
    for i = n-1 : -1 : 1
        x(i) = b(i);
        % Ciclo interno: accumulo la somma parziale
        for k = i+1:n
            x(i) = x(i) - U(i,k) * x(k);
        end
        % Divisione finale per l'elemento diagonale
        x(i) = x(i) / U(i,i);
    end

end
