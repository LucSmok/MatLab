function plotComplexSequence3()
% Fourier-Reihe: (1/2)*exp(1i*x) + sum((1i/(pi*(1-2*n)))*exp(2*pi*1i*n*x))

% Anzahl der Schritte für die diskrete Berechnung
N = 10000;

% Bereich für die x-Achse
x = linspace(-4*pi, 4*pi, N);
disp(x);
% Anzahl der Terme in der Summe
M = 5000;

% Initialisierung der Funktion
f = zeros(1, N);
% Berechnung der Fourier-Reihe
for n = -M:M
    f = f + (1i/((pi)*((1-2*n)))) * exp(2*1i*n*x);
end
f = f + 0.5*exp(1i*x);

disp(f);
% Darstellung der Ergebnisse
figure;
plot3(x, real(f), imag(f), 'LineWidth', 2);
xlabel('x-Achse');
ylabel('Realteil');
zlabel('Imaginärteil');
title('Darstellung der Funktion in der gaußschen Zahlenebene');

end