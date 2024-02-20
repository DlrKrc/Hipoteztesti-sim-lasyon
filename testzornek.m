clc
clear
tekrar=20000
n=100
mu=10   % merkezi parametre
s=4       % standart sapma
ALFA=0.05
mu1=15
for i=1:tekrar
x= normrnd(mu,s,1,n);      % parametreleri mu=10, sigma=4 olan normal da��l�mdan
                           % n �apl� �rnek.
ort=mean(x);
LR(i)=(ort-mu)/(s/sqrt(n)); % varyans�n B�L�N�YOR olmas� ko�ulu alt�nda mu=10 
                           % hipotezinin testi i�in likelihood ratio(LR) yoluyla 
                           % elde edilmi� test istatisti�i.
end
LR=sort(LR);
kLR1=LR(floor(tekrar*(ALFA/2)))     % alfa/2 ye kar��l�k, LR test istatisti�inin MC da��l�m�
kLR2=LR(floor(tekrar*(1-(ALFA/2)))) % 1-(alfa/2) ye kar��l�k, LR test istatisti�inin MC da��l�m�
                                    % �zerinden elde edilen �st krtik de�er.

zk1=norminv(ALFA/2,0,1)         
zk2=norminv(1-(ALFA/2),0,1)

hist(LR,100)

x= normrnd(mu1,s,1,n);
ort=mean(x)
LRO=(ort-mu)/(s/sqrt(n))

if LRO<=kLR1 | LRO>=kLR2
    'Hipotez red'
else 'Hipotez kabul'
end


