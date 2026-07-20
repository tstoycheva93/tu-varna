function [thiv4,nniv4]=idiv4(z,na,nb,nk)
% formira strukturi na modeli (1:na,1:nb,1:nk)
% oceniawa ARX modeli s razlichni strukturi;
% opredelia nai-dobrata struktura po izbran kriterii s 'krit';
% opredelia parametri na model s nai -dobrata struktura;
nstruc=struc(1:na,1:nb,1:nk);
v=ivstruc(z,z,nstruc);
nniv4=selstruc(v,'aic')
thiv4=iv4(z,nniv4);
present(thiv4)
                   