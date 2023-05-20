function plotComplexSequence()
% Fourier-Reihe: (1/2)*exp(1i*x) + sum((1i/(pi*(1-2*n)))*exp(2*pi*1i*n*x))

% Anzahl der Schritte für die diskrete Berechnung
N = 500;

% Bereich für die x-Achse
x = linspace(-pi, pi, N);

% Anzahl der Terme in der Summe
M = 500;

% Initialisierung der Funktion
f = zeros(1, N);

% Berechnung der Fourier-Reihe
for n = -M:M
    f = f + (1i/((pi)*((1-2*n)))) * exp(2*1i*n*x);
end
f = f + 0.5*exp(1i*x);

% Darstellung der Ergebnisse
figure;
plot3(x, real(f), imag(f), 'LineWidth', 2);
xlabel('x-Achse');
ylabel('Realteil');
zlabel('Imaginärteil');
title('Darstellung der Funktion in der gaußschen Zahlenebene');

end