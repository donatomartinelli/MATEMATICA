function L = cholDec(A)
% CHOLDEC Esegue la fattorizzazione di Cholesky.
%  L = cholDec(A) esegue la fattorizzazione di Cholesky (A=L*L')
%  La matrice A deve essere Simmetrica Definita Positiva.
%
%  Input:
%    A - Matrice dei coefficienti (n x n)
%   
%  Output:
%    L - Matrice triangolare inferiore (n x n)

    %% 1. Validazione degli Input
    arguments
        A (:,:) double {mustBeNumeric}
    end
    
    %% 2. Verifica Dimensioni
    % Estraggo le dimensioni
    [n, m] = size(A);

    % Verifico se la matrice è quadrata
    if n ~= m
        error('cholDec:NonSquareMatrix', 'La matrice dei coefficienti deve essere quadrata (Size: %dx%d).', n, m);
    end

    %% 3. Metodo di Cholesky
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
        L(i,i) = 0;        % Inizializza accumulatore
        for k = 1:i-1
            L(i,i) = L(i,i) + L(i,k)^2;
        end
        
        % Radice quadrata finale per la diagonale
        argRad = A(i,i) - L(i,i);
        
        % Controllo di sicurezza
        if argRad <= 0
            error('cholDec:nonDefPosMatrix','La matrice non è definita positiva.')
        end
        
        L(i,i) = sqrt(argRad);
    end
end
