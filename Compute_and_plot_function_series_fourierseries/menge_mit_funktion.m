x = linspace(-3, 3, 2000);
y = linspace(-3, 3, 2000);

[X, Y] = meshgrid(x, y);

% Berechnung der Funktionswerte
Z = X./X;  % Beispiel-Funktion, hier kannst du deine eigene Funktion einsetzen


mask_i = (X>=0) & (X<=1) & (Y>=(6*X.^2-6*X)) & (Y<=exp(X));
mask_ii = (x>=1) & (x<=2) & (Y>=1) & (Y<=X);
mask_iii = (X>=1) & (X<=2) & (Y>=1) & (Y<=(sqrt(1-(X-2).^2))+1);
mask_iiii = ((X>=1) & (X<=2) & (Y>=1) & (Y<=x)) | ((X>=2) & (X<=3) & (Y>=(x-1)) & (Y<=2));
mask_iiiii = ((X>=1) & (X<=2) & (Y>=1) & (Y<=3)) | ((X>=2) & (X<=3) & (Y>=1) & (Y<=2));
mask_iiiiii = ((X>=1) & (X<=2) & (Y>=1) & (Y<=3)) | ((X>=2) & (X<=3) & (Y>=(2-(x-2))) & (Y<=3));


pcolor(X, Y, Z);
shading interp;
hold on;
contour(X, Y, mask_i, 'k', 'LineWidth', 2);  % Umrisse der Maske
xlabel('x');
ylabel('y');
title('Funktion mit Farbverlauf');
colorbar;
grid on;
hold off;
