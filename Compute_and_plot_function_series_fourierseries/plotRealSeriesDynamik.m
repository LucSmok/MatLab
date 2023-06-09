function plotRealSeriesDynamik()
    % Anzahl der Schritte für die diskrete Berechnung
    N = 10000;

    n = 25; % Max Anzahl der Reihenglieder

    startIndex = 1;

    % Bereich für die x-Achse
    x = linspace(-10, 10, N);

    %term = sprintf('-(2/(((2*n-1)^2)*pi^2))*cos((2*n-1)*x)+(((-1)^(n+1))/(n*pi))*sin(n*x)');
    %term = sprintf('((-1)^n)*power(x, n)');
    %term = sprintf('((2*n)/(factorial(n)))*power((x-1.),n)'); %G34i
    %term = sprintf('(n/factorial(n))*power(x,n)');
    %term = sprintf('(-3*power((x-1),n))-6*(power((x-2),n))');
    %term = sprintf('3*power((x-1),n)-6*(power((x-2),n))');%H17a
    %term = sprintf('3*power((x-1),n)-6*(power((x-2),n))');(2/n)*((-1)^(n+1))*cos(n*x)
    
    %term = sprintf('(2/n)*(power(-1,n+1))*sin(n*x)'); %H19 funktioniert
    term = sprintf('(2/(pi*power(n,2)))*(power((-1),n)-1)*cos(n*x)'); %H19 funktioniert
    
    x_scaled = x / pi; % Skalierung der x-Achse
    x_a = x; %x_scaled %Wähle x-Achse
    % Werte ausschließen
    excluded_values = [2,3];
    x = setdiff(x, excluded_values);

  
    % c_0
    %offset = sprintf('1/4'); 
    offset = sprintf('pi/2'); 

   
    y = 0;%((3*(x'-1))./(((power(x,2))-5*x)'+6));%H17a %Vergleichsfunktion

   

    % Erstelle eine Figur und Achsen für den Schieberegler
    figure;
    ax = axes('Position', [0.1, 0.2, 0.8, 0.6]);

    % Erstelle den Schieberegler
    M_slider = uicontrol('Style', 'slider', 'Units', 'normalized', ...
        'Position', [0.3, 0.05, 0.4, 0.05], 'Value', 13, ...
        'Min', 1, 'Max', n, 'SliderStep', [1/9999, 100/9999], ...
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
        f = computeFourierSeries(x, M, n_term);

        % Lösche den alten Plot, falls vorhanden
        if isfield(ax, 'Children')
            delete(ax.Children);
        end

        % Darstellung der Ergebnisse
        plot(ax, x_a, f,'LineWidth', 2);
        hold on;
        plot(ax, x_a, y, 'LineWidth', 2);
        hold off;
        xlabel(ax, 'x-Achse'); % aktualisierte Beschriftung
        ylabel(ax, 'f(x)');
        title(ax, 'Darstellung der Reihe / Funktion');

        % Setze die Y-Limite für die Imaginär- und Realachse auf 1.2
        xlim(ax, [-10, 10]);
        ylim(ax, [-10, 10]);

    end
end
