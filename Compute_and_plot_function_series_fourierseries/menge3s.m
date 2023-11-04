x = linspace(-3, 5, 1000);
y = linspace(-3, 5, 1000);
z = linspace(-1, 5, 1000);

[X, Y, Z] = meshgrid(x, y, z);

mask_i = double((sqrt(X.^2+Y.^2)<=1) & (0<=Z) & (Z<=-Y+2) & (-1<=X) & (Y<=1));

%mask_i = double((X.^2+Y.^2)<4) & (0<Z) & (Z<(X.^2+Y.^2));


figure;
p = patch(isosurface(X, Y, Z, mask_i));
p.FaceColor = 'red';
p.EdgeColor = 'none';
daspect([1 1 1]);
xlabel('x');
ylabel('y');
zlabel('z');
title('3D-Menge');
view(3);
camlight;
lighting gouraud;
grid on;