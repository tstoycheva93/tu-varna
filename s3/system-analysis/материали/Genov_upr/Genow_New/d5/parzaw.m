% modelirane na obekti w cestotnata oblast 
% clear
% brs=3;
% nn=[1 50 10];
% wn=0;l=1;
% sig=[0 0.05 0.1]; % stojnosti na parametyra na nestacionarnost waw wseki diapazon
% dw=[0.01 0.02 0.1];% stapki na dw waw wseki diapazon
for k=1:nn
 %  b1(k)=2.94;
 %  b0(k)=7.5;
 %  a2(k)=16.485+5*sig(k);
 %  a1(k)=2.94+4*sig(k);
 %  a0(k)=1;
 % wk=(nn(k)-1)*dw(k)+wn;
   num=[b1(k) b0(k)];den=[a2(k) a1(k) a0(k)];
 % w=[wn:dw(k):wk];
   [re,im]=nyquist(num,den,w);
 %  for i1=1:nn(k)
 %     re1(l)=re(i1);
 %     im1(l)=im(i1);
 %     l=l+1;
 %  end
 %  wn=wk;
end

%plot(re1,im1);grid
plot(re,im); grid 