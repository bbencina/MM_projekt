function [K, diam] = konveksna(Ps)
% Funkcija vrne konveksno ogrinjaco podanih tock ter njen premer.
%
% Vhodni podatki:
%Ps 2xn matrika, v kateri so tocke podane v stolpcih.
%
% Izhodni podatki:
%K je 2xm matrika, v kateri so oglišca konveksne ogrinjace podane podane v stolpcih.
%diam je premer mnocice K, torej najdaljša razdalja med tockama v K.

  
  K = grahamScan(Ps);
  
  %% IZRACUN DIAMETRA (ce ne potrebujemo, se raje izognemo v klicu funkcije
  diam = 0;
  for i = 1:size(K, 2)
    for j = (i+1):size(K,2)
      n = norm(K(:,i) - K(:,j));
      if n > diam
        diam = n;
      end
    end
  end
  
end
