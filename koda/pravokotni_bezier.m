function Tp = pravokotni_bezier(B1, B2, tol)
% Funkcija vrne množico presecišc dveh bezierjevih krivulj.
% Uporablja subdivizijski algoritem in presecišca preverja
% s pomocjo pravokotnikov okoli kontrolnih tock.
%
% Vhodni podatki:
%B1 je množica kontrolnih tock prve B. krivulje.
%B2 je množica kontrolnih tock druge B. krivulje.
%tol je toleranca algoritma.
%
% Izhodni podatki:
%Tp je tabela presecišc s tockami v stolpcih.

  Tp = [];
  P1 = pravokotnik(B1);
  P2 = pravokotnik(B2);
  
  % ce se pravokotnika ne sekata, prenehamo
  if ~mnogokotnika_sekata(P1, P2)
    return
  else
  % ce sta pravokotnika dovolj majhna, naj bo to presecišce
    if norm(P1(:,2)-P1(:,1)) < tol && norm(P1(:,4)-P1(:,1)) < tol && norm(P2(:,2)-P2(:,1)) < tol && norm(P2(:,4)-P2(:,1)) < tol
      Tp = [Tp 0.25*sum(P1,2)];
    else
    % sicer naredimo subdivizijo in rekurzivno klicemo
      [k1, k2] = sub_demo(B1, 0.5, 0);
      [k3, k4] = sub_demo(B2, 0.5, 0);
      
      Tp13 = pravokotni_bezier(k1, k3, tol);
      Tp14 = pravokotni_bezier(k1, k4, tol);
      Tp23 = pravokotni_bezier(k2, k3, tol);
      Tp24 = pravokotni_bezier(k2, k4, tol);
      
      % dodamo tocke v tabelo
      Tp = [Tp Tp13 Tp14 Tp23 Tp24];
    end
  end
end
