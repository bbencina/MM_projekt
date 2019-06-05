function seka = premica_seka_pravokotnik(l,P)
% Funkcija doloci, ali premica l seka pravokotnik P ali ne.
% Premica l je podana v obliki l = [tocka, smerni].
% Pravokotnik P je dolocen s tabelo 2x4 oglisc po stolpcih
    
    % normala na premico
    n = [0, -1; 1, 0]*l(:,2);
    n = n/norm(n);
    
    tocka = l(:,1);
    stran_polravnine = zeros(1,4);
    for i = 1:4
        stran_polravnine(i) = sign(dot(n,P(:,i)-tocka));
        
        if stran_polravnine(i) == 0
            seka = 1;
            return
        end
    end
    
    if abs(sum(stran_polravnine)) == 4
        seka = 0;
    else
        seka = 1;
    end
end
