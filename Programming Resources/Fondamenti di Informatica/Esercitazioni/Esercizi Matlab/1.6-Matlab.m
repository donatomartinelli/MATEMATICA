% Definire inline la funzione f(x) = (e^(x+3)sin(x-2)) / (x^3+x^2-3).
% Disegnarne il grafico sugli intervalli [1.5,6] e [1, 1.5] mediante fplot.
% Definito il vettore costituito da 30 punti equispaziati in [1.5 6] e quello in [1, 1.5],
% graficare la funzione mediante il comando plot.
% Confrontare la differenza rispetto a fplot.


% Definizione della funzione (elementwise)
f = @(x) (exp(x+3) .* sin(x-2)) ./ (x.^3 + x.^2 - 3);

% --- Grafici con fplot ---
figure
fplot(f,[1.5,6])          % intervallo [1.5,6]
title('Grafico con fplot su [1.5,6]')

figure
fplot(f,[1,1.5])          % intervallo [1,1.5]
title('Grafico con fplot su [1,1.5]')

% --- Grafici con plot e vettori equispaziati ---
int1 = linspace(1.5,6,30);   % 30 punti in [1.5,6]
int2 = linspace(1,1.5,30);   % 30 punti in [1,1.5]

figure
plot(int1,f(int1),'o-')      % grafico discreto con i punti
title('Grafico con plot (30 punti) su [1.5,6]')

figure
plot(int2,f(int2),'o-')
title('Grafico con plot (30 punti) su [1,1.5]')