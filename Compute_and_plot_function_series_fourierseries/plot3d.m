function plotFunction()
    % Definition der Funktion
    f = @(x, y) ((2*((x^2)+x*y))/((x^2)+(y^2)));

    % Erzeugung der x- und y-Werte
    x = linspace(-10, 10, 100); % Werte für x-Achse
    y = linspace(-10, 10, 100); % Werte für y-Achse


       excluded_values = 0;
    x = setdiff(x, excluded_values);
     excluded_values = 0;
    y = setdiff(y, excluded_values);
    
    % Erzeugung des Gitternetzes
    [X, Y] = meshgrid(x, y);

    % Berechnung der z-Werte für die Funktion
    Z = f(X, Y);

    % Erstellen der Figure
    figure;
    surf(X, Y, Z); % 3D-Darstellung
    xlabel('x');
    ylabel('y');
    zlabel('f(x, y)');
    title('Funktion f(x, y)');
    
    % Aktivieren der Interaktion zum Drehen des Plots
    rotate3d on;
end





