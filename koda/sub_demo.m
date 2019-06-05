function [kontrolne1,kontrolne2] = sub_demo(b,c,risanje)
% SUB_DEMO demonstrira en korak subdivizije za ravninsko
% Bezierovo krivuljo. Pri tem je b tabela 2x(n+1) kontrolnih tock.
% c je subdivizijski parameter 0 <= c <= 1.

    % deCasteljau z robnimi toèkami
    orig = b;
    n = size(b, 2);
    kontrolne1 = zeros(2, n);
    kontrolne2 = zeros(2, n);
    kontrolne1(:, 1) = b(:, 1);
    kontrolne2(:, n) = b(:, n);
    for i = 1:n-1
        bb = (1-c).*b(:, 1:end-1) + c.*b(:, 2:end);
        kontrolne1(:, i+1) = bb(:,1);
        kontrolne2(:, n-i) = bb(:,n-i);
        b = [bb [0;0]];
    end
    
    if risanje == 1
        hold on
        axis equal
        plotBezier(orig, 0);
        plotBezier(kontrolne1, 0);
        plotBezier(kontrolne2, 0);
        hold off
    end
end