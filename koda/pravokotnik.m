function P = pravokotnik(b)
% Funkcija vrne pravokotnik, ki vsebuje vse kontrolne tocke Bezierove
% krivulje.
% b je tabela 2x(n+1) kontrolnih tock po stolpcih
% Pravokotnik P je dolocen s tabelo 2x4 oglisc po stolpcih

P = zeros(2,4);

% poiščemo točki z največjo medsebojno razdaljo
n = size(b,2) - 1;
d = 0;
indeksa_tock = [0 0];
for i = 1:(n+1)
    for j = i+1:(n+1)
        
        razdalja = norm(b(:,i)-b(:,j));
        if razdalja > d
            d = razdalja;
            indeksa_tock = [i j];
            
        end
        
    end
end

% smerni vektor srednjice pravokotnika
s = b(:,indeksa_tock(1)) - b(:,indeksa_tock(2));



d_premice = 0; % največja razdalja preostalih točk do srednjice

for k = 1:(n+1)
    if (k == indeksa_tock(1)) || (k == indeksa_tock(2))
        continue
    else
        % razdalja med točko in premico (zaradi uporabe vektorskega
        % produkta vektorje vložimo v R^3)
        
        b1 = [b(:,k);0];
        b2 = [b(:,indeksa_tock(1));0];
        s1 = [s;0];
        
        razdalja =  norm(cross(s1,b1 - b2))/norm(s1);
        
        if razdalja > d_premice
            d_premice = razdalja;
        end
    end
        
end


% enotska normala na srednjico pravokotnika
normala = [0 -1;1 0]*s;
normala = normala/norm(normala);

% definiramo oglišča pravokotnika
P(:,1) = b(:,indeksa_tock(1)) + d_premice*normala;
P(:,4) = b(:,indeksa_tock(1)) - d_premice*normala;
P(:,2) = b(:,indeksa_tock(2)) + d_premice*normala;
P(:,3) = b(:,indeksa_tock(2)) - d_premice*normala;

    
end

