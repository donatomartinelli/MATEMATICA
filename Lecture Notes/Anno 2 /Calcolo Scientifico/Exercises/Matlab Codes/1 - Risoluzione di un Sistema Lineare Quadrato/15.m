function V = invL(L, tol)
% INVL calcola l'inversa di una matrice triangolare inferiore ottimizzando
% la sostituzione in avanti con una certa tolleranza
%  V = INVL(L, tol) restituisce l'inversa della matrice L.
%
%  Input:
%    L - Matrice triangolare inferiore numerica (n x n)
%    tol (opzionale) - Tolleranza per la verifica della singolarità (1 x 1)
%    
%  Output:
%    V - Matrice triangolare inferiore numerica inversa di L (n x n)

    %% 1. Validazione Input
    arguments
        L (:,:) double {mustBeNumeric}
        tol (1,1) double {mustBeNumeric} = 1e-10
    end

    %% 2. Controllo Dimensioni
    % Estraggo le dimensioni
    [n,m] = size(L);

    % Verifico che L sia quadrata
    if n ~= m
        error('invL:NonSquareMatrix', 'La matrice L deve essere quadrata (Input %dx%d).', n, m);
    end

    % Verifico che L sia non singolare
    if any(abs(diag(L)) < tol)
        error('invL:SingularMatrix', 'La matrice L è singolare.');
    end
    
        %% 3. Calcolo Inversa
    % Pre-allocazione (V sarà triangolare inferiore, il resto rimane 0)
    V = zeros(n);

    for j = 1:n
        % 1. Diagonale: inverso del pivot
        V(j,j) = 1 / L(j,j);
        
        % 2. Sostituzione in avanti per la colonna j (righe i > j)
        for i = j+1:n    
            V(i,j) = 0;
            % Sommatoria prodotti noti L(i,k)*V(k,j).
            % Nota: k parte da j (non 1) sfruttando la triangolarità inferiore.
            for k = j:i-1
                V(i,j) = V(i,j) + L(i,k) * V(k,j);
            end
            
            % Risoluzione equazione: L(i,i)*V(i,j) + Somma = 0
            V(i,j) = -V(i,j) / L(i,i);
        end
    end

    
end