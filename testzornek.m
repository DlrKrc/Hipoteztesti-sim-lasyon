clc
clear
tekrar=20000
n=100
mu=10   % merkezi parametre
s=4       % standart sapma
ALFA=0.05
mu1=15
for i=1:tekrar
x= normrnd(mu,s,1,n);      % parametreleri mu=10, sigma=4 olan normal daðýlýmdan
                           % n çaplý örnek.
ort=mean(x);
LR(i)=(ort-mu)/(s/sqrt(n)); % varyansýn BÝLÝNÝYOR olmasý koþulu altýnda mu=10 
                           % hipotezinin testi için likelihood ratio(LR) yoluyla 
                           % elde edilmiþ test istatistiði.
end
LR=sort(LR);
kLR1=LR(floor(tekrar*(ALFA/2)))     % alfa/2 ye karþýlýk, LR test istatistiðinin MC daðýlýmý
kLR2=LR(floor(tekrar*(1-(ALFA/2)))) % 1-(alfa/2) ye karþýlýk, LR test istatistiðinin MC daðýlýmý
                                    % üzerinden elde edilen üst krtik deðer.

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


