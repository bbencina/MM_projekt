% dolocimo koliko tock želimo
n = 10;

% zajamemo tocke
[x, y] = ginput(n);
B = [x' ; y'];

hold on
plotBezier(B, 0);

P = pravokotnik(B);
P = [P P(:,1)];
plot(P(1,:), P(2, :), '-o');

hold off