function sekata = presek_daljic(A1, B1, A2, B2)
% Funkcija vrne 1, ce se daljici sekata, in 0 sicer.
%
% Vhodni podatki:
%Tocki A1 in B1 definirata prvo daljico.
%Tocki A1 in B1 definirata drugo daljico.
%
% Vektorji in koordinate tock so podani kot stolpci.

% Ideja: parametriziramo daljici kot premici s smernim
% vektorjem od Ai do Bi, rešimo sistem za presecišce
% premic in preverimo, ali sta oba koeficienta 0 <= _ <= 1.

  %smerna vektorja:
  s1 = B1 - A1;
  s2 = B2 - A2;
  
  % matrika prvega sistema
  M = [s1 -s2];
  % desna stran
  b = A2 - A1;
  % prvi koeficient
  lambda = M\b;
  
  % matrika drugega sistema
  M = [s2 -s1];
  % desna stran
  b = A1 - A2;
  % drugi koeficient
  mi = M\b;
  
  % preverimo lambda, mi v intervalu (0, 1)
  if 0 <= lambda && lambda <= 1 && 0 <= mi && mi <= 1
    sekata = 1;
  else
    sekata = 0;
  end
  
end