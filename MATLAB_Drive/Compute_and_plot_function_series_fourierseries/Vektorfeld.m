% Erstellen eines Gitters für die x, y und z-Koordinaten im Raum
[x, y, z] = meshgrid(linspace(-2, 2, 10), linspace(-2, 2, 10), linspace(-2, 2, 10));


% Berechnen Sie die Vektorfeldkomponenten für das Gitter
[u, v, w] = vectorFieldFunction(x, y, z);

% Erstellen einer 3D-Figur
figure;
hold on;

% Zeichnen Sie das Vektorfeld
quiver3(x, y, z, u, v, w);


% Einstellungen für die Darstellung anpassen
xlabel('X-Achse');
ylabel('Y-Achse');
zlabel('Z-Achse');
title('3D Vektorfeld');

view(3); % 3D-Ansicht aktivieren
grid on; % Gitter im 3D-Raum aktivieren

% Das "hold off" am Ende aufheben
hold off;
