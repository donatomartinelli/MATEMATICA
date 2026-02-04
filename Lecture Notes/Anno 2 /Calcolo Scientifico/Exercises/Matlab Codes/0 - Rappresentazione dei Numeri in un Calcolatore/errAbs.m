function e = errAbs(valExact, valApprox)
% ERRABS Calcola l'errore assoluto (norma Euclidea della differenza).
%   E = ERRABS(VALEXACT, VALAPPROX) restituisce ||valExact - valApprox||_2.
%   Supporta scalari, vettori e matrici multidimensionali.
    
    %% 1. Validazione degli Input
    arguments
        valExact  double {mustBeNumeric}
        valApprox double {mustBeNumeric}
    end

    %% 2. Controllo Dimensioni 
    % isequal è il metodo standard per confrontare le dimensioni di array/matrici
    if ~isequal(size(valExact), size(valApprox))
        error("errAbs:DimensionMismatch", "Dimensioni incompatibili (%d e %d).", size(valExact), size(valApprox));
    end

    %% 3. Calcolo Errore Assoluto
    e = norm(valExact - valApprox);
end
