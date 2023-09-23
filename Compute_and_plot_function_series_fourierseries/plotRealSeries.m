function plotRealSeries()
    % Anzahl der Schritte für die diskrete Berechnung
    N = 1000;

    % Bereich für die x-Achse
    x = linspace(-10,10, N);

     % Werte ausschließen
    %excluded_values = [2,3];
    %x = setdiff(x, excluded_values);

    

    % Anzahl der Terme in der Summe
    M = 10000;

   
    % Initialisierung der Funktion
    f = zeros(1, N);

    f = f;

    % Berechnung der Fourier-Reihe
    for n = 1:M
        %Klausurephase lernen
        %G31 
        % f =  f + (-2/((pi^2)*(2*n-1)^2)).*cos((2*n-1)*x)+(((-1)^(n+1))/(n*pi)).*sin(n*x)
        f= f + ((1-(-1)^n)/(pi*n))*sin(n*x);
        %f =  f + (-2/((pi^2)*(2*n-1)^2)).*cos((2*n-1)*x)+(((-1)^(n+1))/(n*pi)).*sin(n*x);%(2/n)*((-1)^(n+1))*cos(n*x);%3*power((x-1),n)-6*(power((x-2),n));%(-3*power((x-1),n))-6*(power((x-2),n));%(2/(((2*n-1)^2)*pi^2)) * cos((2*n-1)*x) + ((-1)^(n+1)/(n*pi))*sin(n*x);
    end
    
    %y= 0;%((3*(x-1))./(((power(x,2))-5*x)-6));
    %disp(y);

    disp(f);

    % Darstellung der Ergebnisse
    figure;
    plot(x, f, 'LineWidth', 2);
    hold on;
    %plot(x, y, 'LineWidth', 2);
    hold off;
    xlabel('x-Achse');
    ylabel('F(x)');
    title('Darstellung der Funktion');
    xlim([-10, 10]);
    ylim([-10, 10]);

end
