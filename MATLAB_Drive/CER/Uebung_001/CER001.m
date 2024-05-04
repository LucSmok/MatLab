A = [6 -4; 2 4.5];
B = transpose(A);
d = det(A);
C = B*A;
a = eig(C);
D = inv(A);
E = transpose(D);
F = E*D;
b = eig(F);
g = sqrt(max(a));
h = sqrt(max(b));
k=g*h;
c = cond(A);

O=[0 -1.5; 0 -6];
P=transpose(O);
z=sqrt(max(eig(P*O)));
