function Tp = konveksni_bezier(B1, B2, tol)
% Funkcija vrne množico presecišc dveh bezierjevih krivulj.
% Uporablja subdivizijski algoritem in presecišca preverja
% s pomocjo konveksnih ogrinjac kontrolnih tock.
%
% Vhodni podatki:
%B1 je množica kontrolnih tock prve B. krivulje.
%B2 je množica kontrolnih tock druge B. krivulje.
%tol je toleranca algoritma.
%
% Izhodni podatki:
%Tp je tabela presecišc s tockami v stolpcih.

  Tp = [];
  [K1, d1] = konveksna(B1);
  [K2, d2] = konveksna(B2);
  
  % ce se ogrinjaci ne sekata, prenehamo
  if ~mnogokotnika_sekata(K1, K2)
    return
  else
  % ce sta ogrinjaci dovolj majhni, naj bo središce prve kar presecišce
    if d1 < tol && d2 < tol
      p = 1/size(K1,2)*sum(K1,2);
      Tp = [Tp p];
    else
    % sicer naredimo subdivizijo in rekurzivno klicemo
      [k1, k2] = sub_demo(B1, 0.5, 0);
      [k3, k4] = sub_demo(B2, 0.5, 0);
      
      Tp13 = konveksni_bezier(k1, k3, tol);
      Tp14 = konveksni_bezier(k1, k4, tol);
      Tp23 = konveksni_bezier(k2, k3, tol);
      Tp24 = konveksni_bezier(k2, k4, tol);
      
      % dodamo tocke v tabelo
      Tp = [Tp Tp13 Tp14 Tp23 Tp24];
    end
  end
end