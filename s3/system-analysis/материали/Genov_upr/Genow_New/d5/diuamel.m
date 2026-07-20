 function w=diuamel(N,u,y,delt)
 % opredlia rekursiwno w(t) po integrala na diuamel
 %N - broj na tochkite, w koito se opredelia w(t)
 % u, y  - whod i izhod na obekta w N tochki
 % delt - stapka na diskretizacia
 w(1)=0; w(2)=y(2)/(delt*u(1))
for k=3:N
   s=0;
 for i=1:(k-1)
   s=s+w(k-i)*u(i);
end
w(k)=(y(k)/delt -s)/u(1);
end;w