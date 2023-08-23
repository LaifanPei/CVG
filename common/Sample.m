x0 = [2, 2, 20];
T_final = 20;
alpha = 0;

[t, x] = ode45('Unieq', [0:0.01:T_final], x0, [], alpha);
L = length(x(:, 1));
Ls = 1:L;
X = x(Ls, 1);
Y = x(Ls, 2);
Z = x(Ls, 3);

figure(1)
plot(x(Ls, 2), x(Ls, 3))
grid minor,title('Unified functions'), xlabel('y(t)'), ylabel 'z(t)'

figure(2)
plot(x(Ls, 1), x(Ls, 3))
grid minor,title('Unified functions'), xlabel('x(t)'), ylabel 'z(t)'

figure(3)
plot(x(Ls, 1), x(Ls, 2))
grid minor, title('Unified functions'), xlabel('x(t)'), ylabel 'y(t)'

figure(4)
plot3(x(Ls, 1), x(Ls, 2), x(Ls, 3)), grid
xlabel('x(t)'), ylabel('y(t)'), zlabel('z(t)')
title('Unified functions x(t) vs. y(t) vs. z(t)')

plot(X(1:2000), 'k')
axis([-50, 2050, -19, 19])
A = X(1:2000);

plot(A, 'k')