function [x_bis, i_bis, x_newt, i_newt] = bisnewAlg(a, b, c, m, TOLL, itmax)
% BISNEWALG Metodo ibrido per polinomi.
%
%   La funzione combina la robustezza della Bisezione (per avvicinarsi alla
%   radice) con la velocità di Newton (per affinare il risultato), specifica
%   per equazioni algebriche P(x)=0.
%
%   Input:
%       a, b  : Estremi dell'intervallo iniziale.
%       c     : Vettore dei coefficienti del polinomio.
%       m     : Molteplicità della radice (m=1 per radici semplici).
%       TOLL  : Tolleranza richiesta per la fase finale (Newton).
%       itmax : Max iterazioni per la fase finale (Newton).
%
%   Output:
%       x_bis  : (vector) Storia delle approssimazioni (Bisezione).
%       i_bis  : (int)    Numero iterazioni (Bisezione).
%       x_newt : (vector) Storia delle approssimazioni (Newton).
%       i_newt : (int)    Numero iterazioni (Newton).

    %% 1. Validazione Input
    arguments
        a     (1,1) double
        b     (1,1) double
        c     (1,:) double % Vettore riga dei coefficienti
        m     (1,1) double {mustBePositive} = 1
        TOLL  (1,1) double {mustBePositive} = 1e-6
        itmax (1,1) double {mustBeInteger, mustBePositive} = 100
    end

    %% 2. Fase 1: Sgrossatura (Bisezione)
    % Usiamo una tolleranza 0.5e-1 fissa per avvicinarci in sicurezza.
    toll_coarse = 0.5e-1; 
    [i_bis, x_bis, ~] = bisecAlg(a, b, c, toll_coarse);

    %% 3. Fase 2: Raffinamento (Newton)
    % Il punto di innesco per Newton è l'ultima approssimazione della Bisezione
    start_point = x_bis(end); 
    [x_newt, i_newt] = newtonAlg(start_point, c, m, TOLL, itmax);

end
