function sekata = mnogokotnika_sekata(P1, P2)
% Funkcija vrne 1, ce se mnogokotnika P1 in P2 sekata,
% in 0 sicer.
%
% Vhodni podatki:
%P1 je 2xN matrika N-kotnika, katere stolpci so oglišca.
%P2 je 2XM matrika M-kotnika, katere stolpci so oglišca.

% Ideja: mnogokotnika imata neprazen presek natanko tedaj,
% ko se seka vsaj en par njunih stranic (potem se avtomaticno
% še vsaj nek drug par), ali pa je en mnogokotnik vsebovan v
% drugem.
% Lažje: najprej bomo preverili, ali je katero ogljišce enega
% mnogokotnika vsebovano v drugem (linearna zahtevnost), kar bo
% avtomaticno pomenilo, da se mnogokotnika sekata. Nato se bomo
% lotili primera, ko se sekajo le stranice (kvadratna zahtevnost).

  N = size(P1, 2);
  M = size(P2, 2);
  
  %% OGLIŠCA (preverjamo vektorsko)
  
  % preverimo oglišca P1
  [in, on] = inpolygon(P1(1,:), P1(2,:), P2(1,:), P2(2,:));
  if sum(sum(in)) > 0 || sum(sum(on)) > 0
    sekata = 1;
    return
  end
  % preverimo še oglišca P2
  [in, on] = inpolygon(P2(1,:), P2(2,:), P1(1,:), P1(2,:));
  if sum(sum(in)) > 0 || sum(sum(on)) > 0
    sekata = 1;
    return
  end
  
  %% STRANICE (žal ne vidim vektorske rešitve)
  for i = 2:N
    for j = 2:M
      if presek_daljic(P1(:,i-1), P1(:,i), P2(:,j-1), P2(:,j))
        sekata = 1;
        return
      end
    end
  end
  % poskrbimo še za posebne primere, ki jih prejšnja zanka ni pokrila
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
