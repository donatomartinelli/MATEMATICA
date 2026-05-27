% Si realizzi uno script in MATLAB che richieda l'inserimento dei tre coefficienti 
% di un'equazione di secondo grado e stampi il valore delle radici reali.

% Inserimento dei coefficienti a, b, c
a = input("Inserisci primo coefficiente: ");
b = input("Inserisci secondo coefficiente: ");
c = input("Inserisci terzo coefficiente: ");

% Calcolo del discriminante
det = b^2 - 4 * a * c;

% Verifica dei casi possibili
if det < 0
    % Nessuna radice reale
    disp("Non ci sono radici reali.")
elseif det == 0
    % Radici reali coincidenti
    sol = -b / (2 * a);   % calcolo di una sola radice
    disp("Le radici reali esistono e coincidono.")
    disp(['x = ' num2str(sol)]);
else
    % Due radici reali e distinte
    sol1 = (-b + sqrt(det)) / (2 * a);
    sol2 = (-b - sqrt(det)) / (2 * a);
    disp("Le radici reali esistono e sono distinte.")    
    disp(['x1 = ' num2str(sol1) '   x2 = ' num2str(sol2)]);
end
