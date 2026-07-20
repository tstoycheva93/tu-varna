function  b=REME(F,y,N,c,ro,L)
% presmiata robastni ocenki po modificirani ostataci
% F - matrica vhodni danni Nxnn
% nn - broi regresionni koeficienti
% y - izhodna welichina, vektor
% c - koeficient (1.3 - 1.8)
% ro - koeficient, relaksacionen mnojitel  (0 - 2)
% L - broi iteracii (10-20)
y1=y;
Z=(F'*F)^-1*F';
b(:,1)=Z*y1;
for k=2:L
   y2=F*b(:,k-1);
   r=y1-y2;
      s=1.483*median(abs(r-median(r)));
r=r/s;
   for i=1:N
      if r(i,1)<-c;
         r1(i,1)=-c;
      elseif abs(r(i,1))<=c;
         r1(i,1)=r(i,1);   
      else
         r1(i,1)=c;
      end,end
   r1=r1*s;
      bb=Z*r1;
   b(:,k)=b(:,k-1)+ro*bb;
end

  