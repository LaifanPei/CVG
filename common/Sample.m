Value_x0 = [2, 2, 20];
T_final = 20;
alpha = 0;

[Time, Value_x] = ode45('Unieq', [0:0.01:T_final], Value_x0, [], alpha);
Length = length(Value_x(:, 1));
Lengths = 1:Length;
index_X = Value_x(Lengths, 1);
index_Y = Value_x(Lengths, 2);
index_Z = Value_x(Lengths, 3);

figure(1)
plot(Value_x(Lengths, 2), Value_x(Lengths, 3))
grid minor,title('Unified functions'), xlabel('y(t)'), ylabel 'z(t)'

figure(2)
plot(Value_x(Lengths, 1), Value_x(Lengths, 3))
grid minor,title('Unified functions'), xlabel('x(t)'), ylabel 'z(t)'

figure(3)
plot(Value_x(Lengths, 1), Value_x(Lengths, 2))
grid minor, title('Unified functions'), xlabel('x(t)'), ylabel 'y(t)'

figure(4)
plot3(Value_x(Lengths, 1), Value_x(Lengths, 2), Value_x(Lengths, 3)), grid
xlabel('x(t)'), ylabel('y(t)'), zlabel('z(t)')
title('Unified functions x(t) vs. y(t) vs. z(t)')

plot(index_X(1:2000), 'k')
axis([-50, 2050, -19, 19])
Time_Series = index_X(1:2000);

plot(Time_Series, 'k')