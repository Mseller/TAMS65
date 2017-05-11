% Uppgift 5: Avvikande värden, så kallade outliers
close all, clear, clc;

x = [85729 8154 58805  8673 218395 575143   5174  66896  57204  57353  92162  18508   7811   4666 264636 116648  27111   4644  14727 ...
    5395 3365  6144  3964  6233  8139 65219 35149 360295  7395 49622 16300  5643  2505 88611 184377 103124 12724  2410  6162 110221 ...
    102956 62013 625449 33887 23780 70680  9853 280125 55658 142731 398472 168607 26222 50319 160942 137634  60746 77989 22261 12457 ...
    6808  3826 183653  8587 18318  8025  2490]';
y = [263  73 248  65 570 795  90 182 270 186 122  89  36  29 652 502  83  33  38  29   9  71  23  30  22 242 127 847  76 105 102  29 ...
    10 289 305 282  67  39  29 271 563 112 560  47  90 267  43 446 145 570 1013 533 148 311 305 194 229 124 114 108  27  37 498  46 ...
    120  88   5]';
%% Som text!
log10X = log10(x);

log10Y = log10(y);

figure
scatter(log10X,log10Y,'*')
xlabel('log10X'), ylabel('log10Y')
hold on
lsline



%% Regresionsanalys med log10X och log10Y


stats = regstats(log10Y, log10X, 'linear', 'all');

% Plottar lite användvara data
residualer = stats.r;
figure
scatter(x,residualer, 'filled')

figure
hist(residualer)
title('Histogram för residualer')

figure
normplot(residualer)

%% Prediktionsintervall för Y0
betahat = stats.tstat.beta;
dfe = stats.tstat.dfe;
t = tinv(0.9975, dfe);
s2 = stats.mse;
s = sqrt(s2);
XtXinv = stats.covb/s2;
u = [1 log10(433186)]';

logI_Y0 = [u'*betahat-t*s*sqrt(1+u'*XtXinv*u),u'*betahat+t*s*sqrt(1+u'*XtXinv*u)];
I_Y0 = I_Y0.^10


