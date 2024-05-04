% Funktion, die geplottet werden soll: f(x) = 759.909*10^3 * log((30+20*cos(x))/(30-20*cos(x)))

% X-Bereich von 0 bis 2*pi
x = 0:0.01:2*pi;

a = 30*10^(-3);
b = 20*10^(-3);
w = 2*pi*50;
% Funktion f(x) berechnen
y = -6*10^(-7)*( ((a^2-2*a*b*cos(x)+b^2) ./ (a^2+2*a*b*cos(x)+b^2)).*(  ((a^2+2*a*b*cos(x)+b^2).*2*a*b.*sin(x)*w + 2*a*b.*sin(x)*w.*(a^2-2*a*b*cos(x)+b^2)) ./ ((a^2-2*a*b*cos(x)+b^2).^2) ));

% Plot erstellen
figure;  % Neue Figur erstellen
plot(x, y);  % Plot der Funktion erstellen

% Diagramm anpassen
xlabel('x');  % Beschriftung der x-Achse
ylabel('f(x)');  % Beschriftung der y-Achse
title('Plot der Funktion Übung 10 Etit');  % Titel des Diagramms
grid on;  % Gitterlinien im Diagramm anzeigen
