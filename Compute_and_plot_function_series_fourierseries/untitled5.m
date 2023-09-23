% Definition der Funktion
fun = @(x, y) x.*y

% Erstellen eines Gitters von x- und y-Werten mit feinerer Schrittweite
[X, Y] = meshgrid(-5:0.005:5, -5:0.005:5);

% Auswertung der Funktion für jedes x- und y-Paar
Z = fun(X, Y);

% Erstellen der Maske
mask_i = (X>=1) & (X<=2) & (Y>=1) & (Y<=2);

mask_iii = (X>=1) & (X<=2) & (Y>=1) & (Y<=(sqrt(1-(X-2).^2))+1);


% Setze die Werte außerhalb der Maske auf NaN, um sie nicht zu plotten
Z(~mask_iii) = NaN;

% Darstellung des 3D-Diagramms der Funktion mit den Maskenwerten als Wände
figure;
surf(X, Y, Z);
hold on;

% Zeichne die Wände
wall_color = [0.5 0.5 0.5]; % Farbe der Wände (Grau)
wall_height = max(Z(:)); % Höhe der Wände (maximaler Z-Wert)
wall_alpha = 0.5; % Transparenz der Wände
wall_thickness = 0.1; % Dicke der Wände
plot3([1 2], [1 1], [0 wall_height], 'color', wall_color, 'linewidth', wall_thickness, 'FaceAlpha', wall_alpha); % Wand 1
plot3([2 2], [1 2], [0 wall_height], 'color', wall_color, 'linewidth', wall_thickness, 'FaceAlpha', wall_alpha); % Wand 2
plot3([1 2], [2 2], [0 wall_height], 'color', wall_color, 'linewidth', wall_thickness, 'FaceAlpha', wall_alpha); % Wand 3
plot3([1 1], [1 2], [0 wall_height], 'color', wall_color, 'linewidth', wall_thickness, 'FaceAlpha', wall_alpha); % Wand 4

title('3D-Darstellung der Funktion mit Wänden');
xlabel('x');
ylabel('y');
zlabel('f(x, y)');

% Achsenlimits anpassen
xlim([-5 5]);
ylim([-5 5]);
zlim([min(Z(:)) wall_height]);
