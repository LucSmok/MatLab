function plotFourierSeries3()
% Eingabe der Funktion
function_str = inputdlg('Geben Sie eine Funktion ein:', 'Funktion eingeben');
function_str = function_str{1};
% Restlicher Code...
% Definiere den Definitionsbereich
x = linspace(-pi, pi, 1000); % x-Achse von -pi bis pi

% Erstelle anonyme Funktion
f = str2func(['@(x)' function_str]);

% Berechne die Fourierkoeffizienten
N = 1; % Anzahl der Reihenglieder
a0 = 1/(2*pi) * integral(f, -pi, pi); % Mittelwert
ak = zeros(1, N); % Koeffizienten für k>0
bk = zeros(1, N); % Koeffizienten für k>0
for k = 1:N
    ak(k) = 1/pi * integral(@(x) f(x) .* cos(k*x), -pi, pi);
    bk(k) = 1/pi * integral(@(x) f(x) .* sin(k*x), -pi, pi);
end

% Berechne die Fourierreihe
y = a0/2;
for k = 1:N
    y = y + ak(k) * cos(k*x) + bk(k) * sin(k*x);
end

% Realteil und Imaginärteil der Funktion extrahieren
real_part_func = real(f(x));
imag_part_func = imag(f(x));

% Realteil und Imaginärteil der Fourierreihe extrahieren
real_part_fourier = real(y);
imag_part_fourier = imag(y);

% Skaliere x-Achse in Pi-Einheiten und füge 2*pi Periodizität hinzu
x_pi = mod(x, 2*pi) / pi;

% Grafische Darstellung
figure;
scatter3(x_pi, real_part_func, imag_part_func, 'filled', 'MarkerFaceColor', 'b');
hold on;
plot3(x_pi, real_part_fourier, imag_part_fourier, 'r-', 'LineWidth', 2); % Fourierreihe als Linie darstellen
%plot3(x_pi, real_part_fourier, imag_part_fourier, 'filled', 'MarkerFaceColor', 'r');
xlabel('x / \pi'); % x-Achse mit Einheit \pi beschriften
ylabel('Realteil');
zlabel('Imaginärteil');
title('Gaussische Zahlenebene: Funktion und Fourierreihe');
legend('Funktion', 'Fourierreihe');
grid on;
