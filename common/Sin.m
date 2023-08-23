f = 1;
t = 0:0.01:10;
x = sin(5*pi*f*t);
% plot(t,x,'k');
A = x(1:1000);
plot(A, 'k')
axis([-50, 1050, -1.1, 1.1])
