function plotRealSeriesVerstaendnis()
    % Anzahl der Schritte für die diskrete Berechnung
    N = 10000;

    n = 100; % Max Anzahl der Reihenglieder

    startIndex = 0;

    % Bereich für die x-Achse
    x = linspace(-4*pi, 4*pi, N);
    x_scaled = x / pi; % Skalierung der x-Achse

    term0 = sprintf('(2/((2*0+1)*pi))*sin((2*0+1)*x)'); % Aufgabe 1 x_1
    term1 = sprintf('(2/((2*1+1)*pi))*sin((2*1+1)*x)'); % Aufgabe 1 x_1
    term2 = sprintf('(2/((2*2+1)*pi))*sin((2*2+1)*x)'); % Aufgabe 1 x_1
    term3 = sprintf('(2/((2*3+1)*pi))*sin((2*3+1)*x)'); % Aufgabe 1 x_1
    term4 = sprintf('(2/((2*4+1)*pi))*sin((2*4+1)*x)'); % Aufgabe 1 x_1
 
    offset = sprintf('1/2');
   
  
    % Erstelle eine Figur und Achsen für den Schieberegler
    figure;
    ax = axes('Position', [0.1, 0.2, 0.8, 0.6]);
 
        % Berechnung der Fourier-Reihe
        n_offset = @(x) eval(offset);
        n_term0 = @(x) eval(term0);
        n_term1 = @(x) eval(term1);
        n_term2 = @(x) eval(term2);
        n_term3 = @(x) eval(term3);
        n_term4 = @(x) eval(term4);
        
        F = zeros(1, N);
        F = F+n_offset(x);

        F0 = zeros(1, N);
        F0 = F0+n_term0(x);

        F1 = zeros(1, N);
        F1 = F1+n_term1(x);

        F2 = zeros(1, N);
        F2 = F2+n_term2(x);

        F3 = zeros(1, N);
        F3 = F3+n_term3(x);

        F4 = zeros(1, N);
        F4 = F4+n_term4(x);

        % Lösche den alten Plot, falls vorhanden
        if isfield(ax, 'Children')
            delete(ax.Children);
        end

       
        % Darstellung der Ergebnisse
      
        
        plot(ax, x_scaled, F, 'LineWidth', 2);
        hold on;
        plot(ax, x_scaled, F0, 'LineWidth', 2);
        plot(ax, x_scaled, F1, 'LineWidth', 2);
        plot(ax, x_scaled, F2, 'LineWidth', 2);
        plot(ax, x_scaled, F3, 'LineWidth', 2);
        plot(ax, x_scaled, F4, 'LineWidth', 2);

        %plot(ax, x_scaled, g,'LineWidth', 2);
        %hold off;
        xlabel(ax, 'x-Achse in pi'); % aktualisierte Beschriftung
        ylabel(ax, 'f(x)');
        title(ax, 'Darstellung der Reihe / Funktion');

         

end

