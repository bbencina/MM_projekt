function [K, diam] = konveksna(Ps)
% Funkcija vrne konveksno ogrinjaco podanih tock ter njen premer.
%
% Vhodni podatki:
%Ps 2xn matrika, v kateri so tocke podane v stolpcih.
%
% Izhodni podatki:
%K je 2xm matrika, v kateri so oglišca konveksne ogrinjace podane podane v stolpcih.
%diam je premer mnocice K, torej najdaljša razdalja med tockama v K.

  % ogrinjaco izracunamo z vgrajeno funkcijo convhull, ki nam pove, katere
  % izmed tock Ps tvorijo oglišca konveksne ogrinjace
  H = convhull(Ps(1,:), Ps(2,:));
  % razdelimo komponente
  xs = Ps(1,:); ys = Ps(2, :);
  % filtriramo
  xs = xs(H); ys = ys(H);
  
  K = [xs ; ys];
  
  %% IZRACUN DIAMETRA (ce ne potrebujemo, se raje izognemo v klicu funkcije
  diam = 0;
  for i = 1:size(Ps, 2)
    for j = (i+1):size(Ps,2)
      n = norm(K(:,i) - K(:,j));
      if n > diam
        diam = n;
      end
    end
  end
  
end
