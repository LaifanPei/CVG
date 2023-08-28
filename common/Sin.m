index_f = 1;
Time = 0:0.01:10;
index_x = sin(5*pi*index_f*Time);
% plot(t,x,'k');
Time_Series = index_x(1:1000);

plot(Time_Series, 'k')
axis([-50, 1050, -1.1, 1.1])
