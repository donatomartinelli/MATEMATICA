function x = backwardSub(U, b)
%{
BACKWARDSUB Risolve il sistema lineare triangolare superiore Ux = b usando la vettorizzazione (più veloce in esecuzione). 
  x = BACKWARDSUB(U, b) restituisce il vettore soluzione x.

  INPUT:
    U - Matrice quadrata triangolare superiore (n x n)
    b - Vettore dei termini noti (n x 1)

  OUTPUT:
    x - Vettore soluzione (n x 1)
%}
    %% 1. Validazione degli Input
    arguments
        U (:,:) double {mustBeNumeric}
        b (:,1) double {mustBeNumeric}
    end

    %% 2. Controllo Dimensioni
    % Ricaviamo le dimensioni
    n = size(U, 1);
    
    % Verifichiamo che U sia quadrata
    if size(U, 2) ~= n
        error('BackwardSub:NonSquareMatrix', 'La matrice U deve essere quadrata.');
    end

    % Verifichiamo che b sia compatibile con U
    if length(b) ~= n
        error('BackwardSub:DimensionMismatch', 'Le dimensioni di U e b non corrispondono.');
    end
    
    %% 3. Controllo Singolarità
    % Se c'è uno zero sulla diagonale, non possiamo dividere.
    % Usiamo una piccola tolleranza per i numeri floating point.
    if any(abs(diag(U)) < eps)
        error('BackwardSub:SingularMatrix', 'La matrice è singolare.');
    end

    %% 4. Algoritmo Vettorizzato
    % Pre-allocazione
    x = zeros(n, 1);

    % Calcoliamo l'ultimo elemento manualmente per avviare il processo
    x(n) = b(n) / U(n,n);
    
    for i = n-1 : -1 : 1
        sommatoria = U(i, i+1:n) * x(i+1:n);
        x(i) = (b(i) - sommatoria) / U(i,i);
    end
    
end
