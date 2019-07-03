% To je graficno testno okolje za preverjanje funkcije konveksni_bezier.

% stevilo tock za testiranje
n = 4; m = 4;

% zajamemo tocke
[x1, y1] = ginput(n);
[x2, y2] = ginput(m);

% sestavimo skupaj
B1 = [x1' ; y1'];
B2 = [x2' ; y2'];

% presecisca
Tp = pravokotni_bezier(B1, B2, 1e-3)

% risanje
hold on
plotBezier(B1, 0);
plotBezier(B2, 0);
for i = 1:size(Tp,2)
  plot(Tp(1,i), Tp(2,i), 'o');
end

hold off
