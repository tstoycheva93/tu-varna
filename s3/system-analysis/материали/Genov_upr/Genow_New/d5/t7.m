tt11=0.1;tt22=-0.2;t11=1;t22=1;
for i=1:3
   tt11=tt11*i;tt22=tt22*i;t11=t11*i;t22=t22*i;
           tt11 tt22 t11 t22 ; fzero('texp',1.2)
   yy(i)=ans
   end        