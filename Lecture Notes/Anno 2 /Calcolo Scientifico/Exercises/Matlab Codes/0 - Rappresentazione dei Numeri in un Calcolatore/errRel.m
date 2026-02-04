function e = errRel(valExact, valApprox, tol)
% ERRREL Calcola l'errore relativo in norma 2.
%   E = ERRREL(VALEXACT, VALAPPROX, TOL) calcola ||valExact- valApprox|| / ||valExact||.
%
%   NOTA: Se ||valExact|| < tol, la funzione restituisce l'errore assoluto
%   per evitare divisioni per zero (NaN/Inf).

    %% 1. Validazione degli Input
    arguments
        valExact  double {mustBeNumeric}
        valApprox double {mustBeNumeric}
        tol (1,1) double {mustBeNumeric} = 1e-10
    end

    %% 2. Calcolo Numeratore (Errore Assoluto)
    num = errAbs(valExact, valApprox);
    
    %% 3. Calcolo Denominatore e Gestione Singolarità
    den = norm(valExact);
    
    if den < tol
        % Caso critico: La soluzione esatta è zero. 
        % L'errore relativo non è definito. Restituiamo l'assoluto.
        warning("errRel:ZeroNorm", "La norma della soluzione esatta è minore della tolleranza. Restituisco Errore Assoluto.");
        e = num;
    else
        e = num / den;
    end
end
