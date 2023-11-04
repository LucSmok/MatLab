function plotComplexSeries()
    % Anzahl der Schritte für die diskrete Berechnung
    N = 1000;

    n = 500; % Start Anzahl der Reihenglieder

    % Bereich für die x-Achse
    x = linspace(-4*pi, 4*pi, N);

    %excluded_values = [1, 2];
    %excluded_values = 1;

    %x = setdiff(x, excluded_values);

  
    %H18 komplex funktioniert 
    term_p = sprintf('((1i./(n*pi))*((exp(1i.*n*pi))-(exp(-1i*n*pi)))+(1i*pi/n)*(exp(-1i*n*pi)+exp(1i*n*pi))+(1i/n)*(exp(1i*n*pi)-exp(-1i*n*pi)))*exp(1i*n*x)');
    term_n = sprintf('((1i./(n*pi))*((exp(1i.*n*pi))+(exp(1i*n*pi)))+(1i*pi/n)*(exp(1i*n*pi)+exp(1i*n*pi))+(1i/n)*(exp(1i*n*pi)+exp(+1i*n*pi)))*exp(1i*n*x)');
        
    offset = sprintf('(1/2)*exp(1*i*x)'); 
    

    % Erstelle eine Figur und Achsen für den Schieberegler
    figure;
    ax = axes('Position', [0.1, 0.2, 0.8, 0.6]);

    % Erstelle den Schieberegler
    M_slider = uicontrol('Style', 'slider', 'Units', 'normalized', ...
        'Position', [0.3, 0.05, 0.4, 0.05], 'Value', n, ...
        'Min', 1, 'Max', 10000, 'SliderStep', [1/9999, 100/9999], ...
        'Callback', @updatePlot);

    % Label für den Schieberegler
    slider_label = uicontrol('Style', 'text', 'Units', 'normalized', ...
        'Position', [0.45, 0.02, 0.1, 0.05], ...
        'String', num2str(round(get(M_slider, 'Value'))), ...
        'HorizontalAlignment', 'center');

    % Berechnung der Fourier-Reihe und Plot aktualisieren
    updatePlot();

    function F = computeFourierSeries(x, M, term_p)
        % Initialisiere F für die Berechnung der Fourier-Reihe
        F = zeros(1, N);
        
        F = F + eval(offset);
        % Berechnung der Fourier-Reihe
         for n = 1:M
         
            F = F + 2*real(term_p(x, n));
     
         end

       
    end

    function updatePlot(~, ~)
        % Aktualisierung des M-Werts aus dem Schieberegler
        M = round(get(M_slider, 'Value'));

        % Aktualisiere den Text des Schieberegler-Labels
        set(slider_label, 'String', num2str(M));

        % Berechnung der Fourier-Reihe
        n_term_p = @(x, n) eval(term_p);
        %n_term_n = @(x, n) eval(term_n);
       
        f = computeFourierSeries(x, M, n_term_p);

        x_scaled = x / pi; % Skalierung der x-Achse

        % Lösche den alten Plot, falls vorhanden
        if isfield(ax, 'Children')
            delete(ax.Children);
        end

        %disp(f);

        % Darstellung der Ergebnisse
        plot3(ax, x_scaled, real(f), imag(f), 'LineWidth', 2);
        hold on;
        %plot3(ax, x_scaled, real(y), imag(y), 'LineWidth', 2);
        hold off;
        xlabel(ax, 'x-Achse in pi'); % aktualisierte Beschriftung
        ylabel(ax, 'Realteil');
        zlabel(ax, 'Imaginärteil');
        title(ax, 'Darstellung der Funktion in der gaußschen Zahlenebene');

        % Setze die Y-Limite für die Imaginär- und Realachse auf 1.2
        %ylim(ax, [-1.2, 1.2]);
        %zlim(ax, [-1.2, 1.2]);

    end
end
