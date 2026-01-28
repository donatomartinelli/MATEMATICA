function [Ag,bg,q] = gaussElimP(A,b,p)
%{
GAUSSELIMP Applica il metodo dell'eliminazione di Gauss alla matrice dei coefficienti e al vettore dei termini noti implementando il pivoting parziale o totale.
  [Ag,bg] = gaussElimP(A,b,p)  restituisce A e b risultanti dall'eliminazione e q (vettore permutazione colonne) necessario per il Totale.
    
    INPUT:
      A - Matrice dei coefficienti (n x n)
      b - Vettore dei termini noti (n x 1)
      p - 1 (Parziale), 0 (Totale)
    
    OUTPUT:
      Ag - Matrice dei coefficienti post-GE (n x n)
      bg - Vettore dei termini noti post-GE (n x 1)
      q  - Vettore permutazione colonne (fondamentale per il Pivoting Totale)
    
    NOTA:
      Nel pivoting totale, lo scambio delle colonne altera l'ordine delle incognite.
      La soluzione 'y' ottenuta dalla sostituzione all'indietro è quindi permutata.
      Per ottenere la soluzione corretta 'x', è NECESSARIO usare 'q' per il riordino:

        [Ag, bg, q] = gaussElimP(A, b, 0);   % 1. Eliminazione
        y = backwardSub(Ag, bg);             % 2. Risoluzione sistema triangolare
        x = zeros(size(y));                 
        x(q) = y;                            % 3. Riordino finale della soluzione
%}
    
    %% 1. Validazione degli Input
    arguments
        A (:,:) double {mustBeNumeric}
        b (:,1) double {mustBeNumeric}
        p (1,1) logical = 1 % Default Parziale
    end
    
    %% 2. Verifica Dimensioni
    [n, m] = size(A);
    
    % Verifico se la matrice è quadrata
    if n ~= m
        error('gaussElimP:nonSquareMatrix', 'La matrice non è quadrata (Size %dx%d).', n, m);
    end
    
    % Verifico se il prodotto Ab è compatibile
    if n ~= length(b)
        error('gaussElimP:nonCompatible', 'Il prodotto non è compatibile (Size (%dx%d)*(%dx1)).', n, m, length(b));
    end
    
    % Inizializzo il vettore delle permutazioni delle colonne
    q = 1:n; 
    
    %% 3. Eliminazione di Gauss
    for k = 1 : n-1
        
        r_glob = k; 
        c_glob = k;

        %% Selezione del Pivot
        if p
            % Pivoting Parziale
            % Trovo il massimo nella colonna k (dal pivot in giù)
            [~, r_rel] = max(abs(A(k:n, k)));
            % Converto in indice globale
            r_glob = r_rel + k - 1;

            c_glob = k; 
        else
            % Pivoting Totale
            % Cerco il max in tutto la matrice attiv A(k:n, k:n)
            subMat = abs(A(k:n, k:n));
            [max_val, lin_idx] = max(subMat(:)); 
            
            % Converto indice lineare in riga/colonna relativi
            [r_rel, c_rel] = ind2sub(size(subMat), lin_idx);
            
            % Converto in indice globale
            r_glob = r_rel + k - 1;
            c_glob = c_rel + k - 1;
        end
                
        %% Scambi        
        % 1. Scambio righe (necessario sia in Parziale che Totale se r_glob != k)
        if r_glob ~= k
            A([k, r_glob], :) = A([r_glob, k], :);
            b([k, r_glob])    = b([r_glob, k]);
        end
        
        % 2. Scambio colonne (A e q) - Solo Totale
        if c_glob ~= k
            A(:, [k, c_glob]) = A(:, [c_glob, k]);
            % Tengo traccia dello scambio di variabili
            q([k, c_glob]) = q([c_glob, k]);
        end
        
        % Controllo pivot nullo (sicurezza)
        if A(k,k) == 0
             error('gaussElimP:zeroPivot', 'Pivot nullo alla riga %d.', k);
        end
        
        % Eliminazione
        for i = k+1 : n
            mol = -A(i,k) / A(k,k);
            A(i, k+1:n) = A(i, k+1:n) + mol * A(k, k+1:n);
            b(i) = b(i) + mol * b(k);
        end
    end
    
    Ag = A;
    bg = b;
end