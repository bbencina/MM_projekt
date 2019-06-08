n = 4; m = 4;

[x1, y1] = ginput(n);
[x2, y2] = ginput(m);

B1 = [x1' ; y1'];
B2 = [x2' ; y2'];

Tp = pravokotni_bezier(B1, B2, 1e-3)

hold on
plotBezier(B1, 0);
plotBezier(B2, 0);
for i = 1:size(Tp,2)
  plot(Tp(1,i), Tp(2,i), 'o');
end

hold off
