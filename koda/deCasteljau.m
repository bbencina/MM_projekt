function tocka = deCasteljau(b,t)
% DE_CASTELJAU izracuna tocko na Bezierovi krivulji pri parametru t
% s pomocjo de Casteljauovega algoritma.
% Stolpci matrike b so kontrolne tocke Bezierove krivulje.
    n = size(b, 2);
    for i = 1:n-1
        bb = (1-t).*b(:, 1:end-1) + t.*b(:, 2:end);
        b = [bb [0;0]];
    end
    tocka = b(:, 1);
end