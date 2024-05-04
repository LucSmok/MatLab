x = linspace(0, 3, 1000);
y = linspace(0, 3, 1000);

[X, Y] = meshgrid(x, y);


mask_i = (x>=1) & (x<=2) & (Y>=1) & (Y<=2);
mask_ii = (x>=1) & (x<=2) & (Y>=1) & (Y<=X);
mask_iii = (X>=1) & (X<=2) & (Y>=1) & (Y<=(sqrt(1-(X-2).^2))+1);
mask_iiii = ((X>=1) & (X<=2) & (Y>=1) & (Y<=x)) | ((X>=2) & (X<=3) & (Y>=(x-1)) & (Y<=2));
mask_iiiii = ((X>=1) & (X<=2) & (Y>=1) & (Y<=3)) | ((X>=2) & (X<=3) & (Y>=1) & (Y<=2));
mask_iiiiii = ((X>=1) & (X<=2) & (Y>=1) & (Y<=3)) | ((X>=2) & (X<=3) & (Y>=(2-(x-2))) & (Y<=3));

contourf(X, Y, mask_iiiiii);
xlabel('x');
ylabel('y');
title('Bla');
colorbar;
grid on;