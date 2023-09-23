x = linspace(0, 3, 1000);
y = linspace(0, 3, 1000);
z = linspace(0, 3, 1000);  % Werte für die dritte Achse Z

[X, Y, Z] = meshgrid(x, y, z);  % Erzeugen des Gitters für X, Y und Z

% Berechnung der Funktionswerte
W = X.*Y.*Z;  % Beispiel-Funktion, hier kannst du deine eigene Funktion einsetzen

mask_i = (x>=1) & (x<=2) & (Y>=1) & (Y<=2);
mask_ii = (x>=1) & (x<=2) & (Y>=1) & (Y<=X);
mask_iii = (X>=1) & (X<=2) & (Y>=1) & (Y<=(sqrt(1-(X-2).^2))+1);
mask_iiii = ((X>=1) & (X<=2) & (Y>=1) & (Y<=x)) | ((X>=2) & (X<=3) & (Y>=(x-1)) & (Y<=2));
mask_iiiii = ((X>=1) & (X<=2) & (Y>=1) & (Y<=3)) | ((X>=2) & (X<=3) & (Y>=1) & (Y<=2));
mask_iiiiii = ((X>=1) & (X<=2) & (Y>=1) & (Y<=3)) | ((X>=2) & (X<=3) & (Y>=(2-(x-2))) & (Y<=3));

figure;
scatter3(X(:), Y(:), Z(:), 10, W(:), 'filled');  % Darstellung der 3D-Punktwolke
hold on;
contour(X(:,:,1), Y(:,:,1), mask_iiiii(:,:,1), 'k', 'LineWidth', 2);  % Umrisse der Maske
xlabel('x');
ylabel('y');
zlabel('z');  % Beschriftung der z-Achse
title('Funktion mit Farbverlauf');
colorbar;
grid on;
hold off;
