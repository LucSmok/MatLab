function plotFourierSeries4()
% Eingabe der Funktion und Fourier-Reihe
f = @(z) z/pi; % Funktion
fourierSeries = @(z) z + 1i*(z-1).^2; % Fourier-Reihe

% Erstellen der Gitterpunkte in der Gausschen Zahlenebene
[X, Y] = meshgrid(-2*pi:0.1:2*pi, -2*pi:0.1:2*pi);
Z = X + 1i*Y;

% Berechnung der Funktion und Fourier-Reihe auf den Gitterpunkten
F = f(Z);
FS = fourierSeries(Z);

% Darstellung der Funktion und Fourier-Reihe
figure;
subplot(1, 2, 1);
surf(X, Y, real(F), 'EdgeColor', 'none');
title('Re[f(z)]');
xlabel('Realteil');
ylabel('Imaginärteil');
zlabel('Skalierte x-Achse');
colorbar;

subplot(1, 2, 2);
surf(X, Y, real(FS), 'EdgeColor', 'none');
title('Re[Fourier-Reihe(z)]');
xlabel('Realteil');
ylabel('Imaginärteil');
zlabel('Skalierte x-Achse');
colorbar;

end
