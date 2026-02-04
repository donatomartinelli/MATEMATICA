function n = cifSigCorr(valExact, valApprox)
% CIFSIGCORR Calcola il numero di cifre significative corrette.
%  n = CIFSIGCORR(valExact, valApprox) calcola il numero di cifre 
%  significative corrette basandosi sull'errore relativo.
%
%  Input:
%    valExact  - Valore esatto (numerico: scalare, vettore o matrice)
%    valApprox - Valore approssimato (numerico: stesse dimensioni di valExact)
%
%  Output:
%    n - Numero intero di cifre significative corrette.

    %% 1. Validazione degli Input
    arguments
        valExact  {mustBeNumeric}
        valApprox {mustBeNumeric}
    end

    %% 2. Controllo Dimensioni
    if ~isequal(size(valExact), size(valApprox))
        error('cifSigCorr:SizeMismatch', 'Gli input devono avere la stessa dimensione.');
    end

    %% 3. Calcolo cifre significative corrette
    err = errRel(valExact, valApprox); % Calcolo l'errore relativo
    n = floor(1-log10(2 * err));
end
