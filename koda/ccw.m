function orientation = ccw(A, B, C)
% Funkcija vrne orientacijo trikotnika ABC v sledeci obliki:
% orientation = det(M), kjer je
% M = [Ax, Ay, 1;
%      Bx, By, 1;
%      Cx, Cy, 1].
% Ce je orientation > 0, je orientacija pozitivna. Z drugimi besedami, premikamo
% se v nasprotni smeri urinega kazalca (ccw je kar kratica za counter-clockwise).
% Ce je orientation = 0, so tocke kolinearne. Ce je orientation < 0, je orientacija
% negativna in premikamo se v smeri urinega kazalca.
%
% Vhodni podatki:
% - vsaka tocka A, B, C je podana kot stolpec z dvema komponentama.

  orientation = (B(1)-A(1))*(C(2)-A(2)) - (C(1)-A(1))*(B(2)-A(2));
end
