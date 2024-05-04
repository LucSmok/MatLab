function plotRealSeries()
    % Anzahl der Schritte für die diskrete Berechnung
    N = 10000;

    n = 100; % Max Anzahl der Reihenglieder

    startIndex = 0;

    % Bereich für die x-Achse
    x = linspace(-4*pi, 4*pi, N);
    x_scaled = x / pi; % Skalierung der x-Achse

    term = sprintf('(2/((2*n+1)*pi))*sin((2*n+1)*x)'); % Aufgabe 1 x_1
    %term_2 = sprintf('(2/((2*n+1)*pi))*sin((2*n+1)*(x+(1/2)*pi))');% Aufgabe 1 x_2
    %term = sprintf('((1/(pi))*(2/(1-4*n^2))*(-1)^n -(4*(-1)^(2*n))/(n^2-1))*cos(2*n*x)'); % Aufgabe 3
    %term = sprintf('4*(-1)^n*((1)/(4*n^2-1))*cos(2*n*x)'); %Aufgabe 3.1
    % Werte ausschließen
    %excluded_values = [2,3];
    %x = setdiff(x, excluded_values);
    offset = sprintf('1/2');
   
   

    % Erstelle eine Figur und Achsen für den Schieberegler
    figure;
    ax = axes('Position', [0.1, 0.2, 0.8, 0.6]);

    % Erstelle den Schieberegler
    M_slider = uicontrol('Style', 'slider', 'Units', 'normalized', ...
        'Position', [0.3, 0.05, 0.4, 0.05], 'Value', 1, ...
        'Min', 1, 'Max', n, 'SliderStep', [1/100, 100/100], ...
        'Callback', @updatePlot);

    % Label für den Schieberegler
    slider_label = uicontrol('Style', 'text', 'Units', 'normalized', ...
        'Position', [0.45, 0.02, 0.1, 0.05], ...
        'String', num2str(round(get(M_slider, 'Value'))), ...
        'HorizontalAlignment', 'center');

    % Berechnung der Fourier-Reihe und Plot aktualisieren
    updatePlot();

    function F = computeFourierSeries(x, M, term)
        % Initialisiere F für die Berechnung der Fourier-Reihe
        F = zeros(1, N);

        % Berechnung der Fourier-Reihe
        for n = startIndex:M
            F = F + term(x, n);
        end

        F = F + eval(offset);
    end

    function updatePlot(~, ~)
        % Aktualisierung des M-Werts aus dem Schieberegler
        M = round(get(M_slider, 'Value'));

        % Aktualisiere den Text des Schieberegler-Labels
        set(slider_label, 'String', num2str(M));

        % Berechnung der Fourier-Reihe
        n_term = @(x, n) eval(term);
        %n_term_2 = @(x, n) eval(term_2);
        f = computeFourierSeries(x, M, n_term);
        
        %g = computeFourierSeries(x, M, n_term_2);
        %g = x./x;

        % Lösche den alten Plot, falls vorhanden
        if isfield(ax, 'Children')
            delete(ax.Children);
        end

       
        % Darstellung der Ergebnisse
        plot(ax, x_scaled, f,'LineWidth', 2);
    
        hold on;
        %plot(ax, x_scaled, g,'LineWidth', 2);
        hold off;
        xlabel(ax, 'x-Achse in pi'); % aktualisierte Beschriftung
        ylabel(ax, 'f(x)');
        title(ax, 'Darstellung der Reihe / Funktion');

        % Setze die Y-Limite für die Imaginär- und Realachse auf 1.2
        %xlim(ax, [-10, 10]);
        %ylim(ax, [-10, 10]);
         

    end
end

