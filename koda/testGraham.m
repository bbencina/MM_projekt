% To je graficno testno okolje za preverjanje funkcije grahamScan.

% dolocimo koliko tock želimo
n = 10;

% zajamemo tocke
[x, y] = ginput(n);
Ps = [x' ; y'];

% narisemo originalno mnozico (tukaj je se povezano,
% ce slucajno risemo mnogokotnike)
hold on
xs = [x ; x(1)];
ys = [y ; y(1)];
plot(xs, ys, '-o');

% konv. ovojnica
K = grahamScan(Ps);
kxs = K(1, :);
kxs = [kxs  kxs(1)];

kys = K(2, :);
kys = [kys  kys(1)];

% narisemo se ovojnico
plot(kxs, kys, '-o');
hold off