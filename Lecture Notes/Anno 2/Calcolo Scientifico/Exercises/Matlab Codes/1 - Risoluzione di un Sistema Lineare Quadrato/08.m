function x = forwardSub(L, b, tol)
% FORWARDSUB Risolve il sistema lineare triangolare inferiore Lx = b usando la sostituzione in avanti. 
%  x = FORWARDSUB(L, b) restituisce il vettore soluzione x.
%
%  Input:
%    L - Matrice quadrata triangolare inferiore (n x n)
%    b - Vettore dei termini noti (n x 1)
%    tol (opzionale) - Tolleranza per verifica della singolarità (1 x 1)
%
%  Output:
%    x - Vettore soluzione (n x 1)

    %% 1. Validazione degli Input
    arguments
        L (:,:) double {mustBeNumeric}
        b (:,1) double {mustBeNumeric}
        tol (1,1) double {mustBeNumeric} = 1e-10
    end

    %% 2. Controllo Dimensioni
    % Estraggo le dimensioni
    [n,m] = size(L);
    
    % Verifico che L sia quadrata
    if n ~= m
        error('forwardSub:NonSquareMatrix', 'La matrice L deve essere quadrata (Input %dx%d).', n, m);
    end

    % Verifico che b sia compatibile con L
    if m ~= length(b)
        error('forwardSub:DimensionMismatch', 'Le dimensioni di L e b non corrispondono (Input (%dx%d)x(%dx1)).',n,m,length(b));
    end
    
    %% 3. Controllo Singolarità
    if any(abs(diag(L)) < tol)
        error('forwardSub:SingularMatrix', 'La matrice è singolare.');
    end

    %% 4. Sostituzione in Avanti
    % Pre-allocazione
    x = zeros(n, 1);

    % Primo elemento
    x(1) = b(1) / L(1,1);

    % Ciclo principale
    for i = 2 : n 
        x(i) = b(i);
        % Ciclo interno: accumulo la somma parziale
        for k = 1:i-1
            x(i) = x(i) - L(i,k) * x(k);
        end
        % Divisione finale per l'elemento diagonale
        x(i) = x(i) / L(i,i); 
    end

end
