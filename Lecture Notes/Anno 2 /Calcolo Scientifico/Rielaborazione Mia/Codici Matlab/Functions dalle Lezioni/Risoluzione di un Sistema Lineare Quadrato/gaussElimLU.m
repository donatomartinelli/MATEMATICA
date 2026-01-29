function [L, U, y] = gaussElimLU(A, b)
%{
GAUSSELIMLU Esegue la fattorizzazione LU e la forward substitution su b.
  [L, U, y] = gaussElimLU(A, b) decompone la matrice A in L*U e trasforma
  il vettore b in y (soluzione di Ly = b) usando l'eliminazione di Gauss
  senza pivoting.

    INPUT:
      A - Matrice dei coefficienti (n x n)
      b - Vettore dei termini noti (n x 1)

    OUTPUT:
      L - Matrice triangolare inferiore unitaria (n x n)
      U - Matrice triangolare superiore (n x n)
      y - Vettore dei termini noti trasformato (soluzione intermedia)

    NOTA TEORICA:
    Segue lo schema algoritmico del testo di riferimento:
    1. Il moltiplicatore m_ik viene calcolato con segno negativo (-a/p).
    2. L'eliminazione avviene per somma (R_i + m_ik * R_k).
    3. La matrice L viene costruita sottraendo i moltiplicatori per
       ripristinare il segno positivo necessario alla fattorizzazione.
%}

    %% 1. Validazione degli Input
    arguments
        A (:,:) double {mustBeNumeric}
        b (:,1) double {mustBeNumeric}
    end

    %% 2. Verifica Dimensioni
    [n, m] = size(A);

    if n ~= m
        error('gaussElimLU:nonSquareMatrix', ...
              'La matrice dei coefficienti deve essere quadrata (Size: %dx%d).', n, m);
    end

    if n ~= length(b)
        error('gaussElimLU:nonCompatible', ...
              'Dimensioni incompatibili tra matrice e vettore ((%dx%d) vs (%dx1)).', ...
              n, m, length(b));
    end

    %% 3. Eliminazione di Gauss
    for k = 1 : n-1
        
        % Controllo pivot nullo (sicurezza per algoritmo senza pivoting)
        if A(k,k) == 0
             error('gaussElimLU:zeroPivot', 'Pivot nullo incontrato alla riga %d.', k);
        end
        
        % Ciclo sulle righe sottostanti
        for i = k+1 : n
            
            % Calcolo del moltiplicatore (negativo, come da schema pag. 38)
            % Salviamo il moltiplicatore direttamente nella parte inferiore di A
            A(i,k) = -A(i,k) / A(k,k);
            
            % Aggiornamento della riga i-esima (Eliminazione)
            % R_i = R_i + m * R_k
            A(i, k+1:n) = A(i, k+1:n) + A(i,k) * A(k, k+1:n);
            
            % Aggiornamento del termine noto (Forward substitution implicita)
            b(i) = b(i) + A(i,k) * b(k);
        end
    end
    
    L = eye(n) - tril(A, -1);
    U = triu(A);
    y = b;

end



    
    %% 1. Validazione degli Input
    arguments
        A (:,:) double {mustBeNumeric}
        b (:,1) double {mustBeNumeric}
    end
    
    %% 2. Verifica Dimensioni
    [n, m] = size(A);
    
    % Verifico se la matrice è quadrata
    if n ~= m
        error('gaussElim:nonSquareMatrix', 'La matrice non è quadrata (Size %dx%d).', n, m);
    end
    
    % Verifico se il prodotto Ab è compatibile
    if n ~= length(b)
        error('gaussElim:nonCompatible', 'Il prodotto non è compatibile (Size (%dx%d)*(%dx1)).', n, m, length(b));
    end
    
    
    %% 3. Eliminazione di Gauss
    for k = 1 : n-1
        % Controllo pivot nullo (sicurezza)
        if A(k,k) == 0
             error('gaussElim:zeroPivot', 'Pivot nullo alla riga %d.', k);
        end
        
        % Eliminazione
        for i = k+1 : n
            A(i,k) = -A(i,k) / A(k,k);
            A(i, k+1:n) = A(i, k+1:n) + A(i,k) * A(k, k+1:n);
            b(i) = b(i) + A(i,k) * b(k);
        end
    end
    
    L = eye(n) - tril(A,-1);
    U = triu(A);
    y = b;
end