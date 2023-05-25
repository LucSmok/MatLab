function plotComplexSeries()
    % Anzahl der Schritte für die diskrete Berechnung
    N = 1000;

    n = 500; % Start Anzahl der Reihenglieder

    % Bereich für die x-Achse
    x = linspace(-4*pi, 4*pi, N);
    excluded_values = [0];
    %x = setdiff(x, excluded_values);

    y=0;%exp(1i*pi);
    %y=x;%exp(1i.*x+2/3*pi);

    %term = sprintf('((1i)/((pi)*((1-2*n))))*exp(2*1i*n*x)');
    %term_n = sprintf('conj((1i*(-1)^n)/((pi)*((1-2*n)))*exp(2*1i*n*x)');
    %v=conj(1i/((pi)*((1-2*n)))) * exp(2*1i*n*x);
    %term = sprintf('- (2/(((2*n-1)^2)*pi^2)) * cos((2*n-1)*x) + ((-1)^(n+1)/(n*pi))*sin(n*x)');
    %term = sprintf('((1i-2*n*pi+2*pi)/(2*(pi)^2*n))*exp(1i*n*x)');
    %term = sprintf('-2*exp(1i*n*x)');
    %term = sprintf('(-2*((2*pi*n-i)*sin(pi*n))/)*exp(1i*x*n)');
    %term = sprintf('((-2*((2*pi*n-1i)*sin(pi*n)+1i*pi*n*cos(pi*n)))/(pi*n^2))*exp(1i*x*n)');
    %term = sprintf('(((1i)/(2*((pi)^2)*n))-(1/pi)*(exp(-1i*n*2*pi)+(1/n)))*exp(1i*n*x)');
    %term = sprintf('(((sin(n*x))/(pi))*(((sin(2*pi*n))/(pi*n^2)-2/n)))');
    %term = sprintf('(-2/(n*(pi)^2))*sin(n*x)');%H18 reel funktioniert
    %term_n = sprintf('conj((-2/(n*(pi)^2)))*sin(n*x)');%H18 reel funktioniert
    %f=(((sin(n*x))/(pi))*(((sin(2*pi*n))/(pi*n^2)-2/n)));

    %term = sprintf('(-2/(n*(pi)^2))*sin(n*x)');%H18 reel funktioniert

    %H18 komplex funktioniert 
    %term = sprintf('((1/(2*pi))*(((1i*((n)*pi-2*pi*(n)-1i)*exp(-1i*(n)*pi))/(pi*(n)^2))-(1i*((n)*(-pi)-2*pi*(n)-1i)*exp(1i*(n)*pi))/(pi*(n)^2)))*exp(1i*x*(n))');
    %term_n = sprintf('((1/(2*pi))*(((-1i*((n)*pi-2*pi*(n)-1i)*exp(1i*(n)*pi))/(pi*(n)^2))-(-1i*((n)*(-pi)-2*pi*(n)-1i)*exp(-1i*(n)*pi))/(pi*(n)^2)))*exp(1i*x*(n))');
    %term = sprintf('((1i./(n*pi))*((exp(1i.*n*pi))-(exp(-1i*n*pi)))+(1i*pi/n)*(exp(-1i*n*pi)+exp(1i*n*pi))+(1i/n)*(exp(1i*n*pi)-exp(-1i*n*pi)))*exp(1i*n*x)');
    
    %w=((1i./(n*pi))*((exp(1i.*n*pi))-(exp(-1i*n*pi)))+(1i*pi/n)*(exp(-1i*n*pi)+exp(1i*n*pi))+(1i/n)*(exp(1i*n*pi)-exp(-1i*n*pi)))*exp(1i*n*x);
    %a=(1/(2*pi))*(((1i*(n*pi-2*pi*n-1i)*exp(-1i*n*pi))/(pi*n^2))-(1i*(n*(-pi)-2*pi*n-1i)*exp(1i*n*pi))/(pi*n^2));
    %term = sprintf('((1i*pi)/n)*2*((-1)^n)*exp(1i*n*x)');
    %term = sprintf('((1i)/(pi*n))*((-1)^n)*exp(1i*n*x)');

    term = sprintf('((1i)/(pi*n))*exp(1i*n*x)');%H18
    term_n = sprintf('conj(((1i)/(pi*n)))*exp(1i*n*x)');
    %term = sprintf('(-((power((-1),n)+1i)/(n*pi)))*exp(n*1i*x)');
    %term_n = sprintf('conj(-((power((-1),n)+1i)/(n*pi)))*exp(n*1i*x)');
    %term = sprintf('(1/(pi*power(n,2)))*(power((-1),n)-1)*exp(1i*n*x)');
    %term_n = sprintf('conj((1/(pi*power(n,2)))*(power((-1),n)-1))*exp(1i*n*x)');
     % c_0
    %offset = sprintf('0.5*exp(1i*x)'); 
    %offset = sprintf('pi/2'); 
    offset = sprintf('-1'); 

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

    function F = computeFourierSeries(x, M, term, term2)
        % Initialisiere F für die Berechnung der Fourier-Reihe
        F = zeros(1, N);

        % Berechnung der Fourier-Reihe
         for l = -M:-1  
        
          % F = F + term2(x, abs(l)).* exp(2*1i*n*x);
         end
        F = F + eval(offset);
        for k = 1:M
            
            %for n = 1:M
            %disp(((cos(n*x))/(pi))*((cos(2*pi*n)-1)/(pi*n^2))+(((sin(n*x))/(pi))*((cos(2*pi*n)-1)/(pi*n^2))));
            %disp((((sin(n*x))/(pi))*(((sin(2*pi*n))/(pi*n^2)-2/n))));
            F = F + term(x, k);
            F = F + term(x, -k); 
            %F = F + term2(x, k); 
                
            
     
        end
        
  
       
    end

    function updatePlot(~, ~)
        % Aktualisierung des M-Werts aus dem Schieberegler
        M = round(get(M_slider, 'Value'));

        % Aktualisiere den Text des Schieberegler-Labels
        set(slider_label, 'String', num2str(M));

        % Berechnung der Fourier-Reihe
        n_term = @(x, n) eval(term);
        n_term_2 = @(x, n) eval(term_n);
        f = computeFourierSeries(x, M, n_term, n_term_2);

        x_scaled = x / pi; % Skalierung der x-Achse

        % Lösche den alten Plot, falls vorhanden
        if isfield(ax, 'Children')
            delete(ax.Children);
        end

        %disp(f);

        % Darstellung der Ergebnisse
        plot3(ax, x_scaled, real(f), imag(f), 'LineWidth', 2);
        hold on;
        plot3(ax, x_scaled, real(y), imag(y), 'LineWidth', 2);
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
