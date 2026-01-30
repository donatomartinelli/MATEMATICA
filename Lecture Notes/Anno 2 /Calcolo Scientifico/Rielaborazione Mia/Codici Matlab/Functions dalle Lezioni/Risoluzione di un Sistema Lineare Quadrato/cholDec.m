function L = cholDec(A)
%CHOLDEC Esegue la fattorizzazione di Cholesky.
%  L = cholDec(A) decompone la matrice A in L*L'
%  La matrice A deve essere Simmetrica Definita Positiva.
%
%    INPUT:
%      A - Matrice dei coefficienti (n x n)
%
%    OUTPUT:
%      L - 

    %% 1. Validazione degli Input
    arguments
        A (:,:) double {mustBeNumeric}
    end
    
    %% 2. Verifica Dimensioni
    [n, m] = size(A);

    if n ~= m
        error('cholDec:nonSquareMatrix', 'La matrice dei coefficienti deve essere quadrata (Size: %dx%d).', n, m);
    end
    
    %% 3. Verifica Simmetria
    if ~isequal(A, A')
        error('cholDec:nonSymmMatrix','La matrice dei coefficienti deve essere simmetrica.')
    end

    %% 2. Metodo di Cholesky
    L = zeros(n);
    
    % Primo elemento
    L(1,1) = sqrt(A(1,1));
    
    for i = 2:n
        % Calcolo elementi fuori diagonale
        for j = 1:i-1
            L(i,j) = 0;    % Inizializza accumulatore
            
            for k = 1:j-1
                L(i,j) = L(i,j) + L(i,k) * L(j,k);
            end 
            
            L(i,j) = (A(i,j) - L(i,j)) / L(j,j); 
        end
        
        % Calcolo elemento diagonale
        L(i,i) = 0;    % Inizializza accumulatore
        for k = 1:i-1
            L(i,i) = L(i,i) + L(i,k)^2;
        end
        
        % Radice quadrata finale per la diagonale
        argRad = A(i,i) - L(i,i);
        
        % Controllo di sicurezza
        if argRad <= 0
            error('cholDec:nonDefPosMatrix','La matrice dei coefficienti non è definita positiva (elemento diagonale <= 0).')
        end
        
        L(i,i) = sqrt(argRad);
    end
end
