% Uppgift 2: Användning av dummy-variabler
close all, clear, clc;

x1 = [6490 7244 7943 6478 3138 8747 2020 4090 3230 8786 1986 9653 9429 2782 8444 6316 2363 7915 6928 5526 3077 ...
    6600 2732 7014 8321 2422 9581 9326 6818 4831 9630 2905 6308 1908 8542 4750 6056 7052 7794 1701]';

x2 = [zeros(20,1); ones(20,1)];

y = [121 169 172 116 53 177 31 94 72 171 23 177 178 65 146 129 40 167 115 123 44 73 8 90 71 37 111 89 72 35 86 40 44 36 78 47 56 75 46 6]';

figure
plot(x1(1:20),y(1:20),'b*')
hold on
plot(x1(21:40),y(21:40),'r*')

%%

% z1 & z2
z1 = x1/1000;
z2 = x2.*z1;

% v1 & v2
v1 = [z1 x2];
v2 = [z1 z2];

% u1 & u2
u1 = [ones(size(x1,1),1) z1 x2];
u2 = [ones(size(x1,1),1) z1 z2];

% Modell 1
stats1 = regstats(y, v1, 'linear', 'all');
betahat1 = stats1.tstat.beta
se1 = stats1.tstat.se
t1 = stats1.tstat.t
s21 = stats1.mse
fstat1 = stats1.fstat

% Modell 2
stats2 = regstats(y, v2, 'linear', 'all');
betahat2 = stats2.tstat.beta
se2 = stats2.tstat.se
t2 = stats2.tstat.t
s22 = stats2.mse
fstat2 = stats2.fstat

