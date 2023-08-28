index_a = 0.2;
index_b = 0.2;
index_c = 5.7;
index_x0 = [-1, 0, 1]';
[Time, index_y] = ode45('rossler', [0:0.1:200], index_x0, [], index_a, index_b, index_c)

plot(Time, index_y)
plot(index_y(:, 1))

figure
index_X = index_y(:, 1);
plot(index_X(1:1000), 'k')
axis([-50, 1050, -10, 13])
Time_Series = index_X(1:2000)

plot(Time_Series, 'k')
axis([-50, 2050, -10, 13])