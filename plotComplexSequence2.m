function plotComplexSequence2()
    % Anzahl der Schritte für die diskrete Berechnung
    N = 500;

    % Bereich für die x-Achse
    x = linspace(-4*pi, 4*pi, N);

    % Anzahl der Terme in der Summe
    M = 4;

    % Initialisierung der Funktion
    f = zeros(1, N);

    % Berechnung der Fourier-Reihe
    for n = 1:M
        f =  f - (2/(((2*n-1)^2)*pi^2)) * cos((2*n-1)*x) + ((-1)^(n+1)/(n*pi))*sin(n*x);
    end

    % Darstellung der Ergebnisse
    figure;
    plot(x, f, 'LineWidth', 2);
    xlabel('x-Achse');
    ylabel('F(x)');
    title('Darstellung der Funktion');

end
