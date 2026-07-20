function [tharmax,nnarmax]=idarmax(z,na,nb,nc,nk)
% formira strukturi na modeli (1:na,1:nb,1:nc,1:nk)
% oceniawa ARMAX modeli s razlichni strukturi;
% opredelia nai-dobrata struktura po AIC kriteria;
% opredelia parametri na model s nai -dobrata struktura;
i=0;
for i1=1:nk
   for i2=1:nc
      for i3=1:nb
         for i4=1:na
            i=i+1;
            nn(i,1)=i4;nn(i,2)=i3;nn(i,3)=i2;
            nn(i,4)=i1;
            if(nk==0);nn(i,4)=0;end
            tharmax=armax(z,nn(i,:));
            AIC(i)=tharmax(2,1);
             end;end;end;end
    [aicmin,j]=min(AIC(1,1:i)); nnarmax=nn(j,:)
tharmax=armax(z,nn(j,:));