function x = forwardSub(L, b)
%{
FORWARDSUB Risolve il sistema lineare triangolare inferiore Lx = b usando la vettorizzazione (più veloce in esecuzione). 
  x = FORWARDSUB(L, b) restituisce il vettore soluzione x.

  INPUT:
    L - Matrice quadrata triangolare inferiore (n x n)
    b - Vettore dei termini noti (n x 1)

  OUTPUT:
    x - Vettore soluzione (n x 1)
%}
    %% 1. Validazione degli Input
    arguments
        L (:,:) double {mustBeNumeric}
        b (:,1) double {mustBeNumeric}
    end

    %% 2. Controllo Dimensioni
    % Ricaviamo le dimensioni
    n = size(L, 1);
    
    % Verifichiamo che L sia quadrata
    if size(L, 2) ~= n
        error('ForwardSub:NonSquareMatrix', 'La matrice L deve essere quadrata.');
    end

    % Verifichiamo che b sia compatibile con L
    if length(b) ~= n
        error('ForwardSub:DimensionMismatch', 'Le dimensioni di L e b non corrispondono.');
    end
    
    %% 3. Controllo Singolarità
    % Se c'è uno zero sulla diagonale, non possiamo dividere.
    % Usiamo una piccola tolleranza per i numeri floating point.
    if any(abs(diag(L)) < eps)
        error('ForwardSub:SingularMatrix', 'La matrice è singolare.');
    end

    %% 4. Algoritmo Vettorizzato
    % Pre-allocazione
    x = zeros(n, 1);

    % Calcoliamo il primo elemento manualmente per avviare il processo
    x(1) = b(1) / L(1,1);

    for i = 2 : n 
        sommatoria = L(i, 1:i-1) * x(1:i-1);
        x(i) = (b(i) - sommatoria) / L(i,i);
    end

end
