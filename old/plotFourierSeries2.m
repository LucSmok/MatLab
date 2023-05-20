function plotFourierSeries()
    % Eingabe der Funktion für den ersten Definitionsbereich
    function_str1 = inputdlg('Geben Sie die Funktion für den ersten Definitionsbereich ein:', 'Funktion eingeben');
    function_str1 = function_str1{1};

    % Eingabe der Funktion für den zweiten Definitionsbereich
    function_str2 = inputdlg('Geben Sie die Funktion für den zweiten Definitionsbereich ein:', 'Funktion eingeben');
    function_str2 = function_str2{1};

    % Eingabe der Definitionsbereiche
    x1_start = inputdlg('Geben Sie den Startwert des ersten Definitionsbereichs ein:', 'Startwert x1');
    x1_start = str2double(x1_start{1});

    x1_end = inputdlg('Geben Sie den Endwert des ersten Definitionsbereichs ein:', 'Endwert x1');
    x1_end = str2double(x1_end{1});

    x2_start = inputdlg('Geben Sie den Startwert des zweiten Definitionsbereichs ein:', 'Startwert x2');
    x2_start = str2double(x2_start{1});

    x2_end = inputdlg('Geben Sie den Endwert des zweiten Definitionsbereichs ein:', 'Endwert x2');
    x2_end = str2double(x2_end{1});

    % Erstelle Definitionsbereiche
    x1 = linspace(x1_start, x1_end, 100);
    x2 = linspace(x2_start, x2_end, 100);

    % Erstelle anonyme Funktionen für die beiden Definitionsbereiche
    f1 = str2func(['@(x)' function_str1]);
    f2 = str2func(['@(x)' function_str2]);

    % Berechne die Fourierkoeffizienten für jeden Definitionsbereich
    N = 2; % Anzahl der Reihenglieder
    a0_1 = 1/(2*pi) * integral(f1, x1_start, x1_end); % Mittelwert für ersten Definitionsbereich
    ak_1 = zeros(1, N); % Koeffizienten für k>0 im ersten Definitionsbereich
    bk_1 = zeros(1, N); % Koeffizienten für k>0 im ersten Definitionsbereich
    a0_2 = 1/(2*pi) * integral(f2, x2_start, x2_end); % Mittelwert für zweiten Definitionsbereich
    ak_2 = zeros(1, N); % Koeffizienten für k>0 im zweiten Definitionsbereich
    bk_2 = zeros(1, N); % Koeffizienten für k>0 im zweiten Definitionsbereich
    for k = 1:N
        ak_1(k) = 1/pi * integral(@(x) f1(x) .* cos(k*x), x1_start, x1_end);
        bk_1(k) = 1/pi * integral(@(x) f1(x) .* sin(k*x), x1_start, x1_end);
        ak_2(k) = 1/pi * integral(@(x) f2(x) .* cos(k*x), x2_start, x2_end);
        bk_2(k) = 1/pi * integral(@(x) f2(x) .* sin(k*x), x2_start, x2_end);
    end

    % Berechne die Fourierreihen für jeden Definitionsbereich
    y1 = a0_1/2;
    y2 = a0_2/2;
    for k = 1:N
        y1 = y1 + ak_1(k) * cos(k*x1) + bk_1(k) * sin(k*x1);
        y2 = y2 + ak_2(k) * cos(k*x2) + bk_2(k) * sin(k*x2);
    end

    % Realteil und Imaginärteil der Funktionen extrahieren
    real_part_func1 = real(f1(x1));
    imag_part_func1 = imag(f1(x1));
    real_part_func2 = real(f2(x2));
    imag_part_func2 = imag(f2(x2));

    % Realteil und Imaginärteil der Fourierreihen extrahieren
    real_part_fourier1 = real(y1);
    imag_part_fourier1 = imag(y1);
    real_part_fourier2 = real(y2);
    imag_part_fourier2 = imag(y2);

    % Grafische Darstellung
    figure;
    scatter3(x1, real_part_func1, imag_part_func1, 'filled', 'MarkerFaceColor', 'b');
    hold on;
    scatter3(x2, real_part_func2, imag_part_func2, 'filled', 'MarkerFaceColor', 'g');
    plot3(x1, real_part_fourier1, imag_part_fourier1, 'r-', 'LineWidth', 2); % Fourierreihe des ersten Definitionsbereichs als Linie darstellen
    plot3(x2, real_part_fourier2, imag_part_fourier2, 'm-', 'LineWidth', 2); % Fourierreihe des zweiten Definitionsbereichs als Linie darstellen
    xlabel('x');
    ylabel('Realteil');
    zlabel('Imaginärteil');
    title('Gaussische Zahlenebene: Funktion und Fourierreihen');
    legend('Funktion (Bereich 1)', 'Funktion (Bereich 2)', 'Fourierreihe (Bereich 1)', 'Fourierreihe (Bereich 2)');
    grid on;
end
