function [kontrolne1,kontrolne2] = sub_demo(b,c,risanje)
% Funkcija vrne kontrolne tocke obeh subdivizijskih podkrivulj pri parametru c.
%
% Vhodni podatki:
%b je 2xn tabela kontrolnih tock s tockami v stolpcih,
%c je subdivizijski parameter,
%risanje je le flag, ki pove, ali se vse krivulje tudi narišejo (za normalno uporabo 0).

    orig = b;
    n = size(b, 2);
    kontrolne1 = zeros(2, n);
    kontrolne2 = zeros(2, n);
	% robne tocke se ujemajo
    kontrolne1(:, 1) = b(:, 1);
    kontrolne2(:, n) = b(:, n);
	
	% de Casteljau, shranjujemo robne tocke kont. trik.
    for i = 1:n-1
        bb = (1-c).*b(:, 1:end-1) + c.*b(:, 2:end);
        kontrolne1(:, i+1) = bb(:,1);
        kontrolne2(:, n-i) = bb(:,n-i);
        b = [bb [0;0]];
    end
    
	% morebitno risanje
    if risanje == 1
        hold on
        axis equal
        plotBezier(orig, 0);
        plotBezier(kontrolne1, 0);
        plotBezier(kontrolne2, 0);
        hold off
    end
end