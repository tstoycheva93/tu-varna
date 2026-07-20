function [NUM1,DEN1,SKG,COND,J,XV,VV]=MNMK(U,V,W,m,n)
%  MNMK определя коефициенти на W(p) по честотни характеристики по МНМК
%    m = - ред на полинома в числителя
%    n = - ред на полинома в знаменателя
%    W=[ ] - вектор, съдържащ честотите
%    U=[ ] - реална честотна характеристика
%    V=[ ] - имагинерна честотна характеристика
%  NUM1, DEN1- коефициенти в числителя и знаменателя на W(p)
%  SKG - средно квадратична грешка от апроксимацията
%  COND - числона обусловеност на матрица X
% J - сума от квадрати на грешката
% X - матрица;  V1 - вектор
fd=size(W);br=fd(1);
l1=m+1;k1=n+1;kx=0;
D1=diag(U);D2=diag(V);
if m==0
   SM2=zeros(size(W));O1=SM2;
end
if n==0|n==1
   SN1=zeros(size(W));SN2=SN1;
end
for e=1:br
   p=W(e);l=0;f=-1;m11=(m/2)+1;
   for c=1:m11
      SM1(e,c)=(p^(2*c-2))*(f^(c+1));O2(e,c)=0;
   end
   l11=(l1/2);
   for c=1:l11
      SM2(e,c)=(p^(2*c-1))*(f^(c+1));O1(e,c)=0;
   end
   kk=0;
   if n==1
      kk=0.5;
   end
   n11=((n/2)+kk);
   for c=1:n11
      if n==1
      else
         SN1(e,c)=(p^(2*c))*(f^c);
      end       
   end
   n11=k1/2;
   for c=1:n11
      SN2(e,c)=(p^(2*c-1))*(f^(c+1));
   end
end
   D1SN1=(-D1)*SN1;D2SN2=D2*SN2;
   D2SN1=(-D2)*SN1;D1SN2=(-D1)*SN2;
   X=cat(1,(cat(2,SM1,O1,D1SN1,D2SN2)),(cat(2,O2,SM2,D2SN1,D1SN2)));%формиране на матрицата  Х
    if m==0
      X=0;X=cat(1,(cat(2,SM1,D1SN1,D2SN2)),(cat(2,O2,D2SN1,D1SN2))); 
   end
   if n==1&m~=0
      X=0;X=cat(1,(cat(2,SM1,O1,D2SN2)),(cat(2,O2,SM2,D1SN2)));
   end
   if n==1&m==0
      X=0;X=cat(1,(cat(2,SM1,D2SN2)),(cat(2,O2,D1SN2)));
   end

   V1=cat(1,U,V);
   X1=(X)';X11=(X1*X);r=rank(X11);s=size(X11);k=s(1);
   if k==r
      B1=(X11^(-1))*X1*V1;%определяне на оценките
      %ИЗВЕЖДАНЕ
k=0;vt=((n/2)+(m+1));p=1;k1=0;vc=((m+1)/2)+0.5;
l=0;l1=0;k2=3;ll=2;kl=0;
for c=1:(m+n+1)
   if c<=(m+1)
      if vc>=c
         k1=c+k;
         M1(k1)=B1(c);
         k=k+1;
      else
         k1=c-vc+p;
         kp=(-1)^m;
         if kp==-1
            k1=k1+0.5;
         end
         M1(k1)=B1(c);
         p=p+1;
      end
   else
      if c<=vt
         if n>1   
         k2=k2+l;
         N1(k2)=B1(c);
         l=2;kl=1;
         end
      else
         if n==1
            c=c+1;
         end
         if c<=(m+n+1)
         k2=l1+ll;
         N1(k2)=B1(c);
         l1=l1+ll;
      end
      if n==1
            c=c-1;N1(1)=1;N1(n+1)=B1(m+n+1);
         end
         end
   end 
end
N1(1)=1;
%disp('Оценките на коефицентите в числителя b0,b1,..,bm :')
%disp(' ')
%disp(M1)
%disp('Оценките на коефицентите в знаменателя а0,а1,...,аn :')
%disp(' ')
%disp(N1)
%else
 %  disp('Не съществува обратна матрица');n=2;kx=1;
end
%----------------------------------------------------
CON=cond(X);%изчисляване на cond
if kx==1
   else
E=V1-X*B1;
J1=(E')*E;%изчисляване на J
SKG1=(sqrt(J1))/(2*br);%изчисляване на средно квадратичната грешка
%изчистване на работното пространсво от променливите генерирани в програмата.
end
NUM1=M1;DEN1=N1;
COND=CON;J=J1;VV=V1;
SKG=SKG1;
XV=X;
clear D1 D1SN1 D1SN2 D2 D2SN1 D2SN2 E  M1 N1 O1 O2  SM1
clear SM2 SN1 SN2 X1  br l11 ll  n11 m11 p r s st vc v X
%clear c e f fd  k1 k2 kk kl l l1 k kx kp CON SKG J1