% ormans
 global tt111 tt222 t111 t222 
for i=1:1000
     t1(i)=2;
   t2(i)=t1(i)+(i-1)+0.0000001;
   tt(i)=t1(i)+t2(i);
   t11(i)=t1(i)/tt(i);
   t22(i)=t2(i)/tt(i);
   ti(i)=t11(i)-t22(i);
   tii(i)=ti(i)^2;
   tt11(i)=t11(i)/ti(i);
   tt22(i)=t22(i)/ti(i);
   h4(i)=1-exp(-0.4/t11(i))*tt11(i)+exp(-0.4/t22(i))*tt22(i);
   h8(i)=1-exp(-0.8/t11(i))*tt11(i)+exp(-0.8/t22(i))*tt22(i);
   h20(i)=1-exp(-2/t11(i))*tt11(i)+exp(-2/t22(i))*tt22(i);
   tt111=tt11(i);tt222=tt22(i);t111=t11(i);t222=t22(i);
   global tt111 tt222 t111 t222; fzero('texp',1.2);
   yy(i)=ans;
   end
   plot(tii,h4);xlabel(' z^2');ylabel('h4');grid;pause
   plot(tii,h8);xlabel(' z^2');ylabel('h8');grid;pause
   plot(tii,h20);xlabel('z^2');ylabel('h20');grid;pause
   plot(tii,yy);grid;pause
   