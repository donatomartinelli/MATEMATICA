function [x_bis, i_bis, x_newt, i_newt] = bisnew(a, b, f, df, toll, itmax)
% BISNEW Metodo ibrido: Sgrossatura con Bisezione + Raffinamento con Newton.
%
%  Input:
%    a, b  - Estremi intervallo iniziale
%    f, df - Funzione e sua Derivata (handle)
%    toll  - Tolleranza richiesta per la fase finale (Newton)
%    itmax - Max iterazioni per la fase finale (Newton)
%
%  Output:
%    x_bis  - (vector)  Storia delle approssimazioni della fase di Bisezione
%    i_bis  - (integer) Numero di iterazioni della fase di Bisezione
%    x_newt - (vector)  Storia delle approssimazioni della fase di Newton
%    i_newt - (integer) Numero di iterazioni della fase di Newton

    %% 1. Validazione Input
    arguments
        a     (1,1) double
        b     (1,1) double
        f     (1,1) function_handle
        df    (1,1) function_handle
        toll  (1,1) double {mustBePositive} = 1e-6
        itmax (1,1) double {mustBePositive, mustBeInteger} = 100
    end

    %% 2. Fase 1: Sgrossatura (Bisezione)
    % Usiamo una tolleranza 0.5e-1 fissa per avvicinarci in sicurezza.
    toll_coarse = 0.5e-1; 
    [x_bis, i_bis] = bisec(a, b, f, toll_coarse);

    %% 3. Fase 2: Raffinamento (Newton)
    % Il punto di innesco per Newton è l'ultimo risultato della Bisezione.
    start_point = x_bis(end); 
    
    [x_newt, i_newt] = newton(start_point, f, df, toll, itmax);

end
