function n = cifDecCorr(valExact, valApprox)
% CIFDECCORR Calcola il numero di cifre decimali corrette.
%  n = CIFDECCORR(valExact, valApprox) calcola il numero di cifre 
%  decimali corrette basandosi sull'errore assoluto.
%
%  Input:
%    valExact  - Valore esatto (numerico: scalare, vettore o matrice)
%    valApprox - Valore approssimato (numerico: stesse dimensioni di valExact)
%
%  Output:
%    n - Numero intero di cifre decimali corrette.
%      Restituisce Inf se valExact e valApprox sono identici (errAbs 0).

    %% 1. Validazione degli Input
    arguments
        valExact  {mustBeNumeric}
        valApprox {mustBeNumeric}
    end

    %% 2. Controllo Dimensioni
    if ~isequal(size(valExact), size(valApprox))
        error('cifDecCorr:SizeMismatch', 'Gli input devono avere la stessa dimensione.');
    end

    %% 3. Calcolo cifre decimali corrette
    err = errAbs(valExact, valApprox); % Calcolo l'errore assoluto
    n = floor(-log10(2 * err));
end
