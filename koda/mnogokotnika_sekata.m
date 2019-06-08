function sekata = mnogokotnika_sekata(P1, P2)
% Funkcija vrne 1, ce se mnogokotnika P1 in P2 sekata,
% in 0 sicer.
%
% Vhodni podatki:
%P1 je 2xN matrika N-kotnika, katere stolpci so ogli�ca.
%P2 je 2XM matrika M-kotnika, katere stolpci so ogli�ca.

% Ideja: mnogokotnika imata neprazen presek natanko tedaj,
% ko se seka vsaj en par njunih stranic (potem se avtomaticno
% �e vsaj nek drug par), ali pa je en mnogokotnik vsebovan v
% drugem.
% La�je: najprej bomo preverili, ali je katero oglji�ce enega
% mnogokotnika vsebovano v drugem (linearna zahtevnost), kar bo
% avtomaticno pomenilo, da se mnogokotnika sekata. Nato se bomo
% lotili primera, ko se sekajo le stranice (kvadratna zahtevnost).

  N = size(P1, 2);
  M = size(P2, 2);
  
  %% OGLI�CA (preverjamo vektorsko)
  
  % preverimo ogli�ca P1
  [in, on] = inpolygon(P1(1,:), P1(2,:), P2(1,:), P2(2,:));
  if sum(sum(in)) > 0 || sum(sum(on)) > 0
    sekata = 1;
    return
  end
  % preverimo �e ogli�ca P2
  [in, on] = inpolygon(P2(1,:), P2(2,:), P1(1,:), P1(2,:));
  if sum(sum(in)) > 0 || sum(sum(on)) > 0
    sekata = 1;
    return
  end
  
  %% STRANICE (�al ne vidim vektorske re�itve)
  for i = 2:N
    for j = 2:M
      if presek_daljic(P1(:,i-1), P1(:,i), P2(:,j-1), P2(:,j))
        sekata = 1;
        return
      end
    end
  end
  % poskrbimo �e za posebne primere, ki jih prej�nja zanka ni pokrila
  for j = 2:M
    if presek_daljic(P1(:,N), P1(:,1), P2(:,j-1), P2(:,j))
      sekata = 1;
      return
    end
  end
  for i = 2:N
    if presek_daljic(P1(:,i-1), P1(:,i), P2(:,M), P2(:,1))
      sekata = 1;
      return
    end
  end
  
  if presek_daljic(P1(:,N), P1(:,1), P2(:,M), P2(:,1))
    sekata = 1;
    return
  end
  
  sekata = 0;

end
