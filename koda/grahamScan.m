function K = grahamScan(Ps)
% Funkcija uporabi algoritem "Graham Scan" za izracun konveksne ogrinjace
% množice tock Ps.
%
% Vhodni podatki:
% Ps je matrika velikosti 2xn, kjer je vsaka izmed n tock predstavjena kot stolpec
% komponent

  % za potrebe sortiranja transponiramo tocke
  Ps = Ps'; n = size(Ps, 1);
  % prazen stack za nalaganje tock konveksne ogrinjace
  % ker matlab/octave nima implementirane te pod. strukt., bo matrika zaenkrat
  % zadostovala
  conv_stack = [];
  
  % najprej najdemo najbolj spodnjo levo tocko.
  Ps = sortrows(Ps, [2, 1]);
  P0 = Ps(1, :);
  
  % nato tocke opremimo s polarnim kotom glede na tocko P0
  % ker smo izbrali najnižjo tocko, bo kot vedno med 0 in pi
  pol_kot = zeros(n, 1);
  for i = 2:n
    % izlušcimo trenutno tocko
    P = Ps(i, :);
    % vektor glede na tocko P0
    v = P - P0;
    % kot po obicajni enacbi za premice
    phi = atan(v(2)/v(1));
    % poskrbimo za pi-periodicnost tangensa
    if phi < 0
      phi = phi + pi;
    end
    pol_kot(i) = phi;
  end
  
  % sortiramo po polarnem kotu
  Ps = [Ps pol_kot];
  Ps = sortrows(Ps, [3]);
  Ps = Ps(:, 1:2);
  
  % zanimivi del
  for i = 1:n
    % pop-amo, ce se premaknemo negativno, nato pushamo
    while 1
      if size(conv_stack, 1) > 1
        A = conv_stack(end-1, :);  A = A';
        B = conv_stack(end, :); B = B';
        C = Ps(i, 1:2); C = C';
        if ccw(A, B, C) < 0
          % pop
          conv_stack = conv_stack(1:end-1, :);
        else
          break;
        end
      else
        break;
      end
    end
    % push
    conv_stack = [conv_stack ; Ps(i, :)];
  end
  K = conv_stack';
  
end
