a = 0.2;
b = 0.2;
c = 5.7;
x0 = [-1, 0, 1]';
[t, y] = ode45('rossler', [0:0.1:200], x0, [], a, b, c)

plot(t, y)
plot(y(:, 1))

figure
X = y(:, 1);
plot(X(1:1000), 'k')
axis([-50, 1050, -10, 13])
A = X(1:2000)

plot(A, 'k')
axis([-50, 2050, -10, 13])