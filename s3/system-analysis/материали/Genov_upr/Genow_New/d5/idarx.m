function [tharx,nnarx]=idarx(z,na,nb,nk)
% formira strukturi na modeli (1:na,1:nb,1:nk)
% oceniawa ARX modeli s razlichni strukturi;
% opredelia nai-dobrata struktura po AIC kriteria;
% opredelia parametri na model s nai -dobrata struktura;
nstruc=struc(1:na,1:nb,1:nk);
v=arxstruc(z,z,nstruc);
nnarx=selstruc(v,'aic')
tharx=arx(z,nnarx);                   