% dolocimo koliko tock želimo
n = 10;

% zajamemo tocke
[x, y] = ginput(n);
Ps = [x' ; y'];

hold on
xs = [x ; x(1)];
ys = [y ; y(1)];
plot(xs, ys, '-o');

K = grahamScan(Ps);
kxs = K(1, :);
kxs = [kxs  kxs(1)];

kys = K(2, :);
kys = [kys  kys(1)];

plot(kxs, kys, '-o');
hold off