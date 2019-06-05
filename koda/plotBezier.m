function plotBezier(b, clr)
% PLOTBEZIER izrise Bezierovo krivuljo in kontrolni poligon. Za izracun
% tocke na krivulji uporabimo deCasteljauov algoritem.
% Stolpci matrike b so kontrolne tocke Bezierove krivulje.
    N = 200;
    ts= linspace(0, 1, N);
    fs = zeros(2, N);
    for i = 1:N
        fs(:, i) = deCasteljau(b, ts(i));
    end
    if clr == 1
        clf
    end
    hold on
    plot(b(1, :), b(2, :), '-o');
    plot(fs(1, :), fs(2, :));
    hold off
end